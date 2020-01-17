class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def completed
    @current_task = Task.find(params[:id])
    if (@current_task.users.include?(current_user))
      @current_task.users.destroy(current_user)
      redirect_to tasks_path
    else

      @current_task.users << current_user
      @current_task.save
      redirect_to tasks_path

    end

  end

end
