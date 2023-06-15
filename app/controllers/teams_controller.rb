class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @action_buttom_label = t(:create_team)
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    @action_buttom_label = t(:edit_team)
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)
    @team.tournament_id = current_user.tournament_id

    respond_to do |format|
      if @team.save
        current_user.update(team_id: @team.id)
        format.html { redirect_to team_url(@team), notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_url(@team), notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:tournament_id, :team_name, :color_shirt1, :color_short1, :color_shirt2, :color_short2, :color_shirt3, :color_short3, :delegate_name, :delegate_last_name, :head_coach_name, :head_coach_last_name, :assistant_coach1_name, :assistant_coach1_last_name, :assistant_coach2_name, :assistant_coach2_last_name, :doctor_name, :doctor_last_name, :physiotherapist_name, :physiotherapist_last_name, :statistical_name, :statistical_last_name, :international_referee_name, :international_referee_last_name)
    end

end
