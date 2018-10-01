class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update]
  skip_before_action :verify_authenticity_token
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
    respond_to do |f|
      f.html { redirect_to tasks_url }
      f.js
    end
  end

  def destroy
    @task = Task.destroy(params[:id])
    respond_to do |f|
      f.html {redirect_to tasks_url}
      f.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :complete)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
