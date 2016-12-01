class UsersController < ApplicationController
  before_action :logged_in_user, only: []
  before_action :correct_user,   only: [:edit, :update, :show, :destroy]
  before_action :admin_user,     only: [:destroy, :admin_orders, :index]


  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = current_user
    @photo = Photo.new
    if session[:access_token]
      @client = Instagram.client(:access_token => session[:access_token])
    end
  end

  def new
  	@user = User.new
  end

   def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Por favor revisa tu email para activar tu cuenta. Puede que el mail tarde unos minutos en llegar y/o llegue a tu bandeja de no deseados."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
       flash[:success] = "Cambios del profile han sido guardados"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Tu cuenta ha sido borrado"
    redirect_to users_url
  end

  def orders
    #users completed albums, should be > than 1
    @orders = current_user.albums.where.not(status: 1)
  end

  def checkout
    album = Album.find(params[:album])
    album.update_attribute(:status, 2)
    redirect_to orders_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
