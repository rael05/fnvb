class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :tournament_for_user, only: %i[ new edit update create ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @action_buttom_label = t(:create_user)
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @action_buttom_label = t(:edit_this_user)
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: t(:user_was_successfully_created) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: t(:user_was_successfully_updated) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_url, notice: t(:user_was_successfully_destroyed) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :tournament_id)
    end

    def tournament_for_user
      tournaments_options = Tournament.all.map { |tournament| [tournament.name, tournament.id] }
      default_option = [[t(:select_tournament), nil]]
      @tournaments_array = default_option + tournaments_options
    end
end
