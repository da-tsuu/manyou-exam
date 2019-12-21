class Admin::UsersController < ApplicationController
  before_action :admin_user, only:[:index,:new,:edit]
  before_action :user_params, only:[:create,:update]
  before_action :set_user, only:[:edit,:update,:destroy,:show]
  def index
    @users = User.select(:id, :name, :email, :password_digest, :created_at, :admin).order("created_at DESC")
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] ="Made New Admin user!"
      redirect_to admin_users_path
    else
      flash[:danger] ="Failed.."
      render "new"
    end
  end
  def edit
    @count_admin = User.where(admin: true).length
  end
  def show
    @task = Task.where(user_id: @user.id)
  end
  def update
    @user.update(user_params)
    if User.where(admin: :true).count == 0
      @user.update(admin: :true)
      redirect_to admin_users_path
      flash[:warning] = "ユーザー【 #{@user.name} 】の権限以外の更新をしました　※管理者は最低一人必要です"
    elsif @user.save == false
      flash[:danger] = "ユーザー情報の更新が出来ませんでした"
      render :edit
    elsif User.where(admin: :true).count >= 1
      redirect_to admin_users_path
      flash[:info] = "ユーザー【 #{@user.name} 】の更新をしました"
    end
  end
  def destroy
    if @user.destroy
      flash[:danger] ="Delete user!"
      redirect_to admin_users_path
    else
      flash[:success] ="少なくとも1つのAdminユーザーが必要です"
      redirect_to admin_user_path(@user)
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
  end
  def admin_user
    # flash[:danger] ='You have no authorization.'
    # redirect_to(root_path) unless current_user.admin?
    if current_user.admin?
      flash[:success] ='Welcome Admin member.'
    else
      flash[:danger] ='You have no authorization.'
      redirect_to root_path
    end
  end
end
