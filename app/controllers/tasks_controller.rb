class TasksController < ApplicationController
  def home
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params) # task_params est une méthode privée)
    @task.save
    redirect_to task_path(@task) # on ouvre la page de la tâche créée
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
