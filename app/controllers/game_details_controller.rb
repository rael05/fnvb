class GameDetailsController < ApplicationController
  before_action :set_game_detail, only: %i[ show edit update destroy ]
  before_action :set_form_options, only: %i[ edit update ]

  # GET /game_details or /game_details.json
  def index
    @game_details = GameDetail.all
  end

  # GET /game_details/1 or /game_details/1.json
  def show
  end

  # GET /game_details/new
  def new
    @game_detail = GameDetail.new
  end

  # GET /game_details/1/edit
  def edit
    authorize! :edit, @game_detail
  end

  # POST /game_details or /game_details.json
  def create
    @game_detail = GameDetail.new(game_detail_params)

    respond_to do |format|
      if @game_detail.save
        format.html { redirect_to game_detail_url(@game_detail), notice: t("ui.created_notice", resource: t("ui.resources.game_detail").capitalize) }
        format.json { render :show, status: :created, location: @game_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_details/1 or /game_details/1.json
  def update
    authorize! :update, @game_detail

    respond_to do |format|
      if @game_detail.update(game_detail_params)
        format.html { redirect_to edit_game_path(@game_detail.game), notice: t("ui.updated_notice", resource: t("ui.resources.game_detail").capitalize) }
        format.json { render :show, status: :ok, location: @game_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_details/1 or /game_details/1.json
  def destroy
    @game_detail.destroy

    respond_to do |format|
      format.html { redirect_to game_details_url, notice: t("ui.destroyed_notice", resource: t("ui.resources.game_detail").capitalize) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_detail
      @game_detail = GameDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_detail_params
      params.require(:game_detail).permit(:game_id, :team_id, :player_id, :detail_type, :number_set, :played_minute, :order, :description)
    end

    def set_form_options
      calendar = @game_detail.game.calendar
      teams = [calendar.teamDetail1, calendar.teamDetail2].compact
      @team_options = teams.map { |team| [team.team_name, team.id] }
      @player_options = Player.where(team_id: teams.map(&:id)).map { |player| [player.full_name, player.id] }
      @player_options.unshift([t("ui.no_player"), nil])
      @detail_types = GameDetail::DETAIL_TYPE_HASH.keys.map { |key| [t("ui.actions.#{key}"), key] }
    end
end
