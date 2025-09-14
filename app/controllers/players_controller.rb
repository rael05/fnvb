class PlayersController < ApplicationController
  load_and_authorize_resource
  before_action :set_player, only: %i[ show edit update destroy ]
  before_action :set_position, only: %i[ edit new create update ]
  before_action :set_gender, only: %i[ edit new create update ]

  def set_position
    @positions = Player::POSITION_HASH.map { |key, value| [value, key] }
  end

  def set_gender
    @genders = Player::GENDER_HASH.map { |key, value| [value, key] }
  end

  # GET /players or /players.json
  def index
    if params[:search].present?
      @players = Player.where("name ILIKE ? OR last_name ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @players = Player.all
    end
  end

  # GET /players/1 or /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)
    @player.team_id = current_user.team_id

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET players/:id/get_players
  def get_players
    @players = Player.where(team_id: params[:id]).map { |player| { id: player.id, name: player.full_name } }.unshift(id: nil, name: "Sin Jugador")
    render json: @players
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:number, :name, :last_name, :position, :birthday, :weight, :height, :nationality, :gender, :image)
    end
end
