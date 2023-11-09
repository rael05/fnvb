class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[ show edit update destroy change_password_yourself ]
  before_action :tournament_for_user, only: %i[ new edit update new_user ]
  before_action :permissions_for_user, only: %i[ new edit update new_user ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @form_path = users_new_user_path
    @form_method = :post
    @action_buttom_label = t(:create_user)
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @form_path = user_path
    @form_method = :patch
    @action_buttom_label = t(:edit_this_user)
    if @user.team_id.present?
      @disabled_tournament = true
    end
  end

  def new_user
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        if current_user&.isPresident?
          UserMailer.with(user: @user, password: user_params[:password]).user_by_president.deliver_later
        end
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
      params_update = user_params
      unless user_params[:password].present?
        params_update = user_params.except(:password)
      end
      if @user.update(params_update)
        if @user.password.present?
          UserMailer.with(user: @user, password: user_params[:password]).change_password_mail.deliver_later
        end
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

  def change_password_yourself
    if @user&.email.present?
      User.send_reset_password_instructions(email: @user.email)
      sign_out @user
      redirect_to :root, notice: 'Se cerro la sesión, Recibirás un email con instrucciones para reiniciar tu contraseña en unos minutos.'
    else
      redirect_to :root, alert: 'No logramos encontrar tu correo.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :tournament_id, :permission, :password, :user_name, :first_name, :last_name)
    end

    def tournament_for_user
      tournaments_options = Tournament.all.map { |tournament| [tournament.name, tournament.id] }
      default_option = [[t(:select_tournament), nil]]
      @tournaments_array = default_option + tournaments_options
    end

    def permissions_for_user
      @permissions_array = User::TYPE_PERMISSION.map { |key, value| [t(key), value] }
    end
end
