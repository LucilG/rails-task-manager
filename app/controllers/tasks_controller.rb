class TasksController < ApplicationController
  def home
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @input_label = @task.completed ? "this task is completed !" : "this task is not completed yet !"
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params) # task_params est une méthode privée)
    @task.save
    redirect_to task_path(@task) # on ouvre la page de la tâche créée
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
