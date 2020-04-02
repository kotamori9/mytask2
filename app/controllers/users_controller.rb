class UsersController < ApplicationController
  
  def edit
  end

  def show
    @user = User.find(params[:id])
    @todos = Todo.where(user_id: current_user.id)
    # binding.pry
    # @tasks = Task.where(id: @todos.task_id )
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end

