class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_task, only: [:edit]

  def index
    if user_signed_in?
      @tasks = current_user.tasks.where(point_id: nil)
      @user = current_user
      @level = Level.find_by(number: @user.player_level + 1)
      @nextlevel = if @level.nil?
                     0
                   else
                     @level.threshold - current_user.exp
                   end
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
    # タスクのポイントを確定
    @task.update(task_params)

    # userを確定
    @user = current_user
    @level = Level.find_by(number: @user.player_level + 1)
    # userの今の経験値が入る
    @tmp_exp = @user.exp
    # 今現在の経験値 + 今回の経験値
    @total_exp = @tmp_exp + @task.point_id
    # ユーザーのトータル経験値を保存
    @user.update(exp: @total_exp)
    # レベルアップ処理
    if @level.threshold <= current_user.exp
      @user.player_level += 1
      @user.save
    end
    redirect_to root_path
  end
end

private
def task_params
  params.require(:task).permit(:content, :point_id).merge(user_id: current_user.id)
end

def set_task
  @task = Task.find(params[:id])
end
