class UsersController < ApplicationController

# def level
#   level = Level.find_by(number: user.player_level + 1)
#    if level.threshold <= current_user.task.sum("point_id")
#     user.player_level += 1
#     user.update(player_level: user.player_level)
#   end
# end





# def finished
    
#   task = Task.find(params[id])
#   user = User.find(task.user_id)

#   total_exp = user.tasks.sum("point_id")
#   total_exp = total_exp + task.point_id
#   user.exp = total_exp
  
#   user.update(exp: total_exp)

#   if level.threshold <= user.exp
#   user.level = user.level + 1
#   user.update(level: user.level)
#   end
# end




# private


