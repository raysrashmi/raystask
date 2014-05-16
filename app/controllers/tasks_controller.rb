class TasksController < ApplicationController
  respond_to :json, only: [:index, :create, :update, :destroy]
  respond_to :html, only: [:index]

  def index
    @tasks = Task.order('updated_at desc').all
    respond_with @tasks
  end
  
  def create
    @task = Task.create(task_params)
    @task.save
    respond_with @task
  end

  def update
    @task =Task.find(params[:id])
    @task.update_attributes(task_params)
    respond_with @task
  end

  def destroy
    @task =Task.find(params[:id])
    @task.destroy
    respond_with @task
  end

  private
  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
