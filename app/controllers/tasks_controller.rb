class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :not_user_block, only: [:new, :index]

  def index
    if params[:sort_expiration]
      @tasks = Task.where(user_id: current_user.id).order(expiration: "asc").page(params[:page]).per(15)
    elsif params[:sort_priority]
      @tasks = Task.where(user_id: current_user.id).order(priority: "asc").page(params[:page]).per(15)
    elsif params[:title] && params[:status] && params[:label_ids]
      @status = params[:status].to_i
      @label_id = params[:label_ids]
      @tasl_labels = TaskLabel.where(label_id: @label_id).pluck(:task_id)
      @tasks = Task.search_label(@tasl_labels).page(params[:page]).per(15)
    elsif params[:title] && params[:status]
        @tasks = Task.where(user_id: current_user.id).search_title(params[:title]).search_status(@status).page(params[:page]).per(15)
    else
      @tasks = Task.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(15)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :expiration, :status, :priority, label_ids: []  )
  end

  def not_user_block
    if logged_in? == false
     redirect_to new_session_path
   end
 end
end