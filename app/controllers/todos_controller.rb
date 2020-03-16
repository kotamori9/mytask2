class TodosController < ApplicationController

  def index
    @todos =Todo.all
    @todo =Todo.new
  end

  def create
    @todo = Todo.create(todo_params)
    if @todo.save
      flash[:notice]='ToDoが作成されました'
      return_back and return
      
    else
      flash[:alert]='ToDoを入力してください'
      return_back and return
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    flash[:alert]='ToDoを削除しました'
    todo.destroy
    return_back and return 
  end

  private
  def todo_params
    params.require(:todo).permit(:todo,:enddate).merge(user_id: current_user.id, task_id: params[:task_id])
  end

end

