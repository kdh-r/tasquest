class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_task, only: [:edit]

  def index 
      if user_signed_in? 
      @tasks = current_user.tasks.where(point_id: nil)
      end
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
  

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
       redirect_to root_path
    end
    # user = User.find(params[:id])
    # level = Level.find_by(number: user.player_level + 1)
    # if level.threshold <= current_user.task.sum("point_id")
    #   # user.player_level += 1
    #   # UPDATE users SET current_user.player_level +  1  WHERE current_user.id;
    #   user.update(player_level: user.player_level)
    #   user.save
    # end
  end
 
end


private
def task_params
  params.require(:task).permit(:content, :point_id).merge(user_id: current_user.id)
end

# def user_params
#   params.require(:user).permit(:name, :email, :password, :player_level)
# end

def set_task
  @task = Task.find(params[:id])
end



    