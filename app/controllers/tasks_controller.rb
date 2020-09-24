class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:user)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

end

private

def task_params
  params.require(:task).permit(:content).merge(user_id: current_user.id)
end
