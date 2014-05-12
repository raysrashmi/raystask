class TasksController < ApplicationController
  respond_to :json, only: [:index, :create]
  respond_to :html, only: [:index]

  def index
    @tasks = Task.all
    respond_with @tasks
  end
  
  def create
    @task = Task.create(task_params)
    @task.save
    respond_with @task
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end
end
