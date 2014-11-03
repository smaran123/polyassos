class TasksController < ApplicationController
#layout "manager"
  before_action :set_task,:except=>[:new,:create,:index]
   
  def index
    @tasks = Task.all if current_worker.manager == true  
    @tasks = Task.where("worker_id = #{current_worker.id}") if current_worker.manager == false
  end

  def new
    @task = Task.new
    if @task.worker_comments.blank?
      @task.worker_comments.build
    end
  end

  def edit
  end

  def show
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render "edit"
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit!
  end

end
