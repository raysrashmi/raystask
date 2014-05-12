class TasksController < ApplicationController
  def index
    p"_______________INdex"
    @tasks = Task.all
    respond_to do|format|
      format.js do
        render json: @tasks
      end
      format.html
    end
  end
end
