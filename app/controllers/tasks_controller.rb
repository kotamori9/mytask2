class TasksController < ApplicationController
  
   def index
    @tasks =Task.all
    @task =Task.new
    
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to root_path(@task), notice: 'ToDoが作成されました'
    else
      redirect_to root_path(@task), alert: 'ToDoを入力してください。'
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path(@task), alert: 'ToDoが削除されました'
  end

  def show
    @task = Task.find(params[:id])
    @today = Date.today
  end

  def search
    @tasks = Task.search(params[:keyword])
  end

  private

  def task_params
    params.require(:task).permit(:content).merge(user_id: current_user.id)
  end

end
