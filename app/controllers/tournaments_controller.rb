class TournamentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_tournament, only: %i[ show edit update destroy ]

  # GET /tournaments or /tournaments.json
  def index
    @tournaments = Tournament.all
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_params
      params.require(:tournament).permit(:name, :description, :international)
    end
end