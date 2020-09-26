class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :destroy]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def destroy
    
    @task.destroy
    redirect_to root_path
  end

end

private

def task_params
  params.require(:task).permit(:content).merge(user_id: current_user.id)
end

def set_task
  @task = Task.find(params[:id])
end