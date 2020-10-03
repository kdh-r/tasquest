class LevelsController < ApplicationController

def create
  user = User.find(user.params[id])
  level = Level.where(number: user.player_level + 1)
  if level.threshold <= current_user.task.sum("point_id")
    user.player_level += 1
    user.update(player_level: user.player_level)
    user.save
  end
end



private

  def user_params
    params.require(:user).permit(:name, :email, :password, :player_level)
  end
end
