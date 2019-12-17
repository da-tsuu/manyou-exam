class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :user_permission, only: [:show]
  before_action :user_prohibit, only: [:new]
  # def index
  #   @users = User.all
  # end

  def show
  end

  def new
    @user = User.new    
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] ='Signed up!!'
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  # def destroy
  #   @user.destroy
  #   redirect_to users_url, notice: 'User was successfully destroyed.'
  # end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :admin)
    end

    def user_permission
      if @user.id != current_user.id
        redirect_to user_path(current_user.id)
      end
    end

    def user_prohibit
      if logged_in?
        redirect_to tasks_path
      end 
    end


end
