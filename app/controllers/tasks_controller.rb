class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    if params[:sort_expiration]
      @tasks = Task.all.order(expiration: "asc").page(params[:page]).per(15)
    elsif params[:sort_priority]
      @tasks = Task.order(priority: "asc").page(params[:page]).per(15)
    elsif params[:title] && params[:status]
      @status = params[:status].to_i
      @tasks = Task.search_title(params[:title]).search_status(@status).page(params[:page]).per(15)
    else
      @tasks = Task.order(created_at: :desc).page(params[:page]).per(15)
    end
    
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:title, :content, :expiration, :status, :priority )
    end
end
