class CalendarsController < ApplicationController
  load_and_authorize_resource
  before_action :set_calendar, only: %i[ show edit update destroy ]
  before_action :variables_for_calendars, only: %i[ new edit update create ]

  # GET /calendars or /calendars.json
  def index
    @selected_year = params[:year].present? ? params[:year].to_i : Date.current.year
    @tournaments = Tournament.where(year: @selected_year).pluck(:name, :id).unshift(["Todos los torneos", 0])
    if params[:tournament_id].present? && params[:tournament_id].to_i > 0
      @selected_tournament = params[:tournament_id].to_i
      @calendars = Calendar.where(tournament_id: @selected_tournament)
    else
      @selected_tournament = 0
      @calendars = Calendar.all
    end
    @tournament = Tournament.find_by(id: @selected_tournament)
    @formatted_data = Calendar.formattedData

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "calendar", template: "calendars/index_pdf", formats: [:pdf]
      end
      format.xlsx do
        render xlsx: "calendar", template: "calendars/index_xlsx", formats: [:xlsx]
      end
    end
  end

  def get_teams_by_tournament
    begin
      @teams = [[I18n.translate(:user_no_team), 0]] + Tournament.find(params[:team_id]).teams.pluck(:team_name, :id)
    rescue ActiveRecord::RecordNotFound
      @teams = [[I18n.translate(:user_no_team), 0]]
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
      params.require(:calendar).permit(:tournament_id, :team1, :team2, :description, :stage, :start_date_time, :status, :year)
    end

    def variables_for_calendars
      @tournaments_array = Tournament.pluck(:name, :id)
      @stage_array = Calendar::TYPE_STAGE.to_a.map{|stage| [t(stage[0]), stage[1]]}
      @status_array = Calendar::TYPE_STATUS.to_a.map{|stage| [t(stage[0]), stage[1]]}
    end
end
