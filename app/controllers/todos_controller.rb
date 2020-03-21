class TodosController < ApplicationController

  def index
    @todos =Todo.all
    @todo =Todo.new
  end

  def create
    @todo = Todo.create(todo_params)
    if @todo.save
      flash[:notice]='ToDoが作成されました'
      redirect_back(fallback_location: root_path)
      
    else
      flash[:alert]='ToDoを入力してください'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    flash[:alert]='ToDoを削除しました'
    todo.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def todo_params
    params.require(:todo).permit(:todo,:enddate).merge(user_id: current_user.id, task_id: params[:task_id])
  end

end

