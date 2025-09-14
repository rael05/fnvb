class TournamentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_tournament, only: %i[ show edit update destroy generate_calendar]

  # GET /tournaments or /tournaments.json
  def index
    @tournaments = records_index(current_user&.isVice?)
  end

  # GET /tournaments/1 or /tournaments/1.json
  def show
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
      format.html { render :show, status: :ok, location: @tournament }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_params
      params.require(:tournament).permit(:name, :description, :international, :image, :search, :year)
    end
end
