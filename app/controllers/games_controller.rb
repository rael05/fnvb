class GamesController < ApplicationController
  load_and_authorize_resource
  before_action :set_game, only: %i[ show edit update destroy game_details ]
  before_action :team_for_game, only: %i[ new edit update ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
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
    
    respond_to do |format|
      if @gameDetail.save
        debugger
        format.html { redirect_to edit_game_path(@game), notice: "El detalle del juego fue guardado exitosamente." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id

    respond_to do |format|
      if @game.save
        format.html { redirect_to edit_game_path(@game), notice: "Game was successfully created." }
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
        format.html { redirect_to edit_game_path(@game), notice: "Game was successfully updated." }
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
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  def team_for_game
    @calendar = Calendar.find_by(id: params[:calendar_id]) || Calendar.find_by(id: @game.calendar_id)
    return redirect_to :not_found unless @calendar

    @team_options = [[@calendar.teamDetail1.team_name, @calendar.teamDetail1.id], [@calendar.teamDetail2.team_name, @calendar.teamDetail2.id]]
    @payer_options = Player.where(team_id: @calendar.teamDetail1.id).map { |p| [p.full_name, p.id] }.unshift(["Sin Jugador", nil])
    @detail_types = GameDetail::DETAIL_TYPE_HASH.to_a.map { |type| [type[1], type[0]] }

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
    params.require(:game_detail).permit(:game_id, :player_id, :team_id, :detail_type, :number_set, :order)
  end
end
