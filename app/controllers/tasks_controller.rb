class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_task, only: [:edit, :destroy]

  def index
    unless 
      if user_signed_in? 
      @tasks = current_user.tasks.order(id: "DESC")   
      end
    end
  end

  def new
    @task = Task.new
  end


  def show
    
    task = Task.find(params[:id])
    if task.finished_at then
      task.update(finished_at: false)
    else
      task.update(finished_at: true)
    end

    item = Task.find(params[:id])
    render json: { task: item }
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

  def finished
    
    task = Task.find(params[id])
    user = User.find(task.user_id)

    total_exp = user.exp
    total_exp = total_exp + task.point_id
    user.exp = total_exp
    
    user.update(exp: total_exp)

    if level.threshold <= user.exp
    user.level = user.level + 1
    user.update(level: user.level)
    end
  end


end

private

def task_params
  params.require(:task).permit(:content, :point_id).merge(user_id: current_user.id)
end

def set_task
  @task = Task.find(params[:id])
end



    