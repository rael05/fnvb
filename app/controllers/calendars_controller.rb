class CalendarsController < ApplicationController
  load_and_authorize_resource
  before_action :set_calendar, only: %i[ show edit update destroy ]
  before_action :variables_for_calendars, only: %i[ new edit update create ]

  # GET /calendars or /calendars.json
  def index
    @calendars = Calendar.all
    @formatted_data = Calendar.formattedData
  end

  def get_teams_by_tournament
    begin
      teams = Tournament.find(params[:team_id]).teams
      if teams.count == 0
        @teams = [["Sin Equipos", 0]]
      else
        @teams = teams.pluck(:team_name, :id)
      end
    rescue ActiveRecord::RecordNotFound
      @teams = [["Sin Equipos", 0]]
    end
  end

  # GET /calendars/1 or /calendars/1.json
  def show
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars or /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to calendar_url(@calendar), notice: "Calendar was successfully created." }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1 or /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to calendar_url(@calendar), notice: "Calendar was successfully updated." }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1 or /calendars/1.json
  def destroy
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to calendars_url, notice: "Calendar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calendar_params
      params.require(:calendar).permit(:tournament_id, :team1, :team2, :description, :stage, :start_date_time, :status)
    end

    def variables_for_calendars
      @tournaments_array = Tournament.pluck(:name, :id)
      @stage_array = Calendar::TYPE_STAGE.to_a.map{|stage| [t(stage[0]), stage[1]]}
      @status_array = Calendar::TYPE_STATUS.to_a.map{|stage| [t(stage[0]), stage[1]]}
    end
end
