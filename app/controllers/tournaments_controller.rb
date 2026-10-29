class TournamentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_tournament, only: %i[ show edit update destroy]
  before_action :set_teams, only: %i[new edit create update]

  # GET /tournaments or /tournaments.json
  def index
    @tournaments = records_index(current_user&.isVice?)
    @tournament_classification = params[:classification]
    case @tournament_classification
    when "national"
      @tournaments = @tournaments.where(international: false)
      @tournament_heading = t("ui.national_tournaments")
      @tournament_index_path = national_tournaments_path
    when "international"
      @tournaments = @tournaments.where(international: true)
      @tournament_heading = t("ui.international_tournaments")
      @tournament_index_path = international_tournaments_path
    else
      @tournament_heading = t(:tournaments)
      @tournament_index_path = tournaments_path
    end
  end

  # GET /tournaments/1 or /tournaments/1.json
  def show
    @standings = tournament_standings
    @calendars = @tournament.calendars.includes(:team_one, :team_two, games: :game_details).order(:start_date_time, :id)

    respond_to do |format|
      format.html
      format.pdf do
        if params[:report] == "calendar"
          @calendars = @tournament.calendars.includes(:team_one, :team_two).order(:start_date_time)
          render pdf: "agenda-#{@tournament.name&.parameterize || @tournament.id}",
                 template: "tournaments/calendar_report",
                 formats: [:pdf],
                 disposition: "attachment"
        else
          @teams = @tournament.teams.order(:team_name)
          render pdf: "equipos-#{@tournament.name&.parameterize || @tournament.id}",
                 template: "tournaments/teams_report",
                 formats: [:pdf],
                 disposition: "attachment"
        end
      end
      format.xlsx do
        if params[:report] == "calendar"
          @calendars = @tournament.calendars.includes(:team_one, :team_two).order(:start_date_time)
          render xlsx: "agenda-#{@tournament.name&.parameterize || @tournament.id}", template: "tournaments/calendar_report", formats: [:xlsx]
        else
          @teams = @tournament.teams.order(:team_name)
          render xlsx: "equipos-#{@tournament.name&.parameterize || @tournament.id}", template: "tournaments/teams_report", formats: [:xlsx]
        end
      end
    end
  end

  # GET /tournaments/new
  def new
    @action_buttom_label = t(:create_tournament)
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
    @action_buttom_label = t(:edit_this_tournament)
  end

  # POST /tournaments or /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to tournament_url(@tournament), notice: t(:tournament_was_successfully_created) }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1 or /tournaments/1.json
  def update
    generated_games = nil
    existing_games = nil

    if params[:generate_calendar].present?
      Tournament.transaction do
        if @tournament.update(tournament_params)
          generated_games, existing_games = generate_missing_games
        end
      end
    else
      @tournament.update(tournament_params)
    end

    respond_to do |format|
      if @tournament.errors.empty?
        notice = if params[:generate_calendar].present?
                   t("ui.calendar_games_generated", count: generated_games, existing: existing_games)
                 else
                   t(:tournament_was_successfully_updated)
                 end
        format.html { redirect_to tournament_url(@tournament), notice: notice }
        format.json { render :show, status: :ok, location: @tournament }
      else
        @action_buttom_label = t(:edit_this_tournament)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordInvalid => error
    @action_buttom_label = t(:edit_this_tournament)
    @tournament.errors.add(:base, t("ui.calendar_generation_failed", error: error.record.errors.full_messages.to_sentence))
    render :edit, status: :unprocessable_entity
  end

  # DELETE /tournaments/1 or /tournaments/1.json
  def destroy
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: t(:tournament_was_successfully_destroyed) }
      format.json { head :no_content }
    end
  end

  private
    def generate_missing_games
      team_ids = @tournament.teams.ids.sort
      pairs = team_ids.combination(2).to_a
      existing_pairs = @tournament.calendars.pluck(:team1, :team2).each_with_object({}) do |(first, second), result|
        result[[first, second].sort] = true if first && second
      end
      missing_pairs = pairs.reject { |pair| existing_pairs.key?(pair) }

      missing_pairs.each do |team_one_id, team_two_id|
        @tournament.calendars.create!(
          team1: team_one_id,
          team2: team_two_id,
          stage: Calendar::TYPE_STAGE[:qualification],
          status: Calendar::TYPE_STATUS[:pending],
          description: ''
        )
      end

      [missing_pairs.length, pairs.length - missing_pairs.length]
    end

    def tournament_standings
      teams_by_id = @tournament.teams.index_by(&:id)
      stats = teams_by_id.keys.index_with do
        { played: 0, won: 0, lost: 0, points: 0 }
      end

      games = Game.joins(:calendar)
                  .where(calendars: {
                    tournament_id: @tournament.id,
                    status: Calendar::TYPE_STATUS[:finished]
                  })
                  .where.not(winning_team: nil)
                  .where.not(lose_team: nil)

      games.each do |game|
        points = case [game.win_score, game.lose_score]
                 when [3, 0], [3, 1] then [3, 0]
                 when [3, 2] then [2, 1]
                 else next
                 end

        winner_stats = stats[game.winning_team]
        loser_stats = stats[game.lose_team]
        next unless winner_stats && loser_stats

        winner_stats[:played] += 1
        winner_stats[:won] += 1
        loser_stats[:played] += 1
        loser_stats[:lost] += 1

        winner_stats[:points] += points[0]
        loser_stats[:points] += points[1]
      end

      stats.sort_by do |team_id, values|
        [-values[:points], -values[:won], teams_by_id.fetch(team_id).team_name]
      end.map { |team_id, values| [teams_by_id.fetch(team_id), values] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def set_teams
      @teams = Team.order(:team_name)
    end

    # Only allow a list of trusted parameters through.
    def tournament_params
      params.require(:tournament).permit(:name, :description, :international, :image, :search, :year, :status, team_ids: [])
    end
end
