class TasksController < ApplicationController

  def home
  end

  def index
    @tasks = Task.all
  end
end
