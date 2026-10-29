class GamesController < ApplicationController
  load_and_authorize_resource
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :team_for_game, only: %i[ new edit update ]

  # GET /games or /games.json
  def index
    @games = can?(:enable_change, Game) ? Game.all : Game.where(enabled: true)
  end

  # GET /games/1 or /games/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        prepare_game_report
        render pdf: "reporte-partido-#{@game.id}",
               template: "games/show_pdf",
               formats: [:pdf],
               disposition: "attachment"
      end
      format.xlsx do
        prepare_game_report
        render xlsx: "reporte-partido-#{@game.id}", template: "games/show_xlsx", formats: [:xlsx]
      end
    end
  end

  # GET /games/new
  def new
    @game = Game.new(calendar_id: params[:calendar_id])
  end

  # GET /games/1/edit
  def edit
    @gameDetail = GameDetail.new(game_id: @game.id)
  end

  def game_details
    @gameDetail = GameDetail.new(game_detail_params)
    @game = @gameDetail.game
    
    respond_to do |format|
      if @gameDetail.save
        format.html { redirect_to edit_game_path(@game), notice: t("ui.updated_notice", resource: t("ui.resources.game_detail").capitalize) }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { redirect_to edit_game_path(@game), alert: @gameDetail.errors.full_messages.to_sentence }
        format.json { render json: @gameDetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id

    respond_to do |format|
      if @game.save
        format.html { redirect_to edit_game_path(@game), notice: t("ui.created_notice", resource: t("ui.resources.game").capitalize) }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to edit_game_path(@game), notice: t("ui.updated_notice", resource: t("ui.resources.game").capitalize) }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: t("ui.destroyed_notice", resource: t("ui.resources.game").capitalize) }
      format.json { head :no_content }
    end
  end

  private
  def prepare_game_report
    @calendar = @game.calendar
    @team_one = @calendar.teamDetail1
    @team_two = @calendar.teamDetail2
    @winner = Team.find_by(id: @game.winning_team)
    @game_details = @game.game_details.order(:number_set, :played_minute, :order).to_a
    @detail_teams = Team.where(id: @game_details.map(&:team_id).compact.uniq).index_by(&:id)
    @detail_players = Player.where(id: @game_details.map(&:player_id).compact.uniq).index_by(&:id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  def team_for_game
    @calendar = Calendar.find_by(id: params[:calendar_id]) || Calendar.find_by(id: @game.calendar_id)
    return redirect_to :not_found unless @calendar
    return redirect_to edit_calendar_path(@calendar), alert: t("ui.assign_match_date_first") if @calendar.start_date_time.blank?

    @team_options = [[@calendar.teamDetail1.team_name, @calendar.teamDetail1.id], [@calendar.teamDetail2.team_name, @calendar.teamDetail2.id]]
    team_ids = [@calendar.teamDetail1&.id, @calendar.teamDetail2&.id].compact
    @payer_options = Player.where(team_id: team_ids).map { |p| [p.full_name, p.id] }.unshift(["Sin Jugador", nil])
    @detail_types = GameDetail::DETAIL_TYPE_HASH.keys.map { |key| [t("ui.actions.#{key}"), key] }

    if @game.winning_team && @game.lose_team
      @winning_team = @game.winning_team
      @lose_team = @game.lose_team
    else
      @winning_team = @calendar.teamDetail1.id
      @lose_team = @calendar.teamDetail2.id
    end
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:winning_team, :lose_team, :win_score, :lose_score, :description, :calendar_id)
  end

  def game_detail_params
    params.require(:game_detail).permit(:game_id, :player_id, :team_id, :detail_type, :number_set, :played_minute, :order)
  end
end
