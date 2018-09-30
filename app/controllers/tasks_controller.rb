class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  def index
    @done = Task.where(complete: true)
    @todo = Task.where(complete: false)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
    respond_to do |f|
      f.html { redirect_to tasks_path }
    
    end
  end

  def edit

  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :complete)
  end

  def set_task
    @task = Task.find(params[:id])
  end

    def set_article
    @article = Article.find(params[:id])
  end
end
