class TournamentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_tournament, only: %i[ show edit update destroy generate_calendar]
  before_action :set_teams, only: %i[new edit create update]

  # GET /tournaments or /tournaments.json
  def index
    @tournaments = records_index(current_user&.isVice?)
  end

  # GET /tournaments/1 or /tournaments/1.json
  def show
    @standings = tournament_standings

    respond_to do |format|
      format.html
      format.pdf do
        if params[:report] == "calendar"
          @calendars = @tournament.calendars.includes(:team_one, :team_two).order(:start_date_time)
          render pdf: "agenda-#{@tournament.name.parameterize}",
                 template: "tournaments/calendar_report",
                 formats: [:pdf],
                 disposition: "attachment"
        else
          @teams = @tournament.teams.order(:team_name)
          render pdf: "equipos-#{@tournament.name.parameterize}",
                 template: "tournaments/teams_report",
                 formats: [:pdf],
                 disposition: "attachment"
        end
      end
      format.xlsx do
        if params[:report] == "calendar"
          @calendars = @tournament.calendars.includes(:team_one, :team_two).order(:start_date_time)
          render xlsx: "agenda-#{@tournament.name.parameterize}", template: "tournaments/calendar_report", formats: [:xlsx]
        else
          @teams = @tournament.teams.order(:team_name)
          render xlsx: "equipos-#{@tournament.name.parameterize}", template: "tournaments/teams_report", formats: [:xlsx]
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
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to tournament_url(@tournament), notice: t(:tournament_was_successfully_updated) }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1 or /tournaments/1.json
  def destroy
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: t(:tournament_was_successfully_destroyed) }
      format.json { head :no_content }
    end
  end

  def generate_calendar
    @tournament.teams.each do |team_one|
      @tournament.teams.each do |team_two|
        next if team_one.id == team_two.id
        next if Calendar.exists?(tournament_id: @tournament.id, team1: team_one.id, team2: team_two.id) or
                Calendar.exists?(tournament_id: @tournament.id, team1: team_two.id, team2: team_one.id)

        Calendar.create({tournament_id: @tournament.id, team1: team_one.id,
                        team2: team_two.id, stage: "C", start_date_time: DateTime.now,
                        status: "P", description: "Primer juego del primer torneo"})
      end
    end
    respond_to do |format|
      format.html { redirect_to tournament_url(@tournament), notice: t("ui.calendar_games_generated") }
    end
  end

  private
    def tournament_standings
      teams_by_id = @tournament.teams.index_by(&:id)
      stats = teams_by_id.keys.index_with do
        { played: 0, won: 0, lost: 0, points: 0 }
      end

      games = Game.joins(:calendar)
                  .where(calendars: { tournament_id: @tournament.id })
                  .where.not(winning_team: nil)
                  .where.not(lose_team: nil)

      games.each do |game|
        winner_stats = stats[game.winning_team]
        loser_stats = stats[game.lose_team]
        next unless winner_stats && loser_stats

        winner_stats[:played] += 1
        winner_stats[:won] += 1
        loser_stats[:played] += 1
        loser_stats[:lost] += 1

        if game.win_score == 3 && game.lose_score == 2
          winner_stats[:points] += 2
          loser_stats[:points] += 1
        elsif game.win_score == 3 && [0, 1].include?(game.lose_score)
          winner_stats[:points] += 3
        end
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
