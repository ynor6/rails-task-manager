class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    #generate a new task object to send to view
    #(DO NOT MAKE IT PRESISTANT)
    @task = Task.new
  end

  def create
    #genrate a Task new and populate it with strong params
    #make it presistant
    @task = Task.new(task_params)
    if @task.save
      redirect_to show_path(@task)
    else
      redirect_to index_path
    end
  end

  def edit
    @task = Task.find(params[:id])
    # We'll see that in a moment.
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.save
      redirect_to show_path(@task)
    else
      redirect_to index_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to index_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
