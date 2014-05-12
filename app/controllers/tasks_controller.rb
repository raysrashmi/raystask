class TasksController < ApplicationController
  respond_to :json, only: [:index]
  respond_to :html, only: [:index]

  def index
    @tasks = Task.all
    respond_with @tasks
  end
  def create
    @task = Task.create(params[:title])
    @task.save
    respond_with @task
  end

  private
  def task_params
    params.permit(:title)
  end
end
