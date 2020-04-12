class TodosController < ApplicationController

  def index
    @todos =Todo.all
    @todo =Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if (@todo.enddate).to_s < (Date.today).to_s
      flash[:alert]='過去の日付は選択できません'
      redirect_back(fallback_location: root_path)

    elsif @todo.invalid?
      flash[:alert]='ToDoを入力してください'
      redirect_back(fallback_location: root_path)

    elsif @todo.save
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

