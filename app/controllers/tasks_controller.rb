class TasksController < ApplicationController
  before_action :set_task, except: [:index, :new, :create]
  before_action :set_list

  def index
    # organize by descending order
    @tasks = @list.tasks.except('order').order("id DESC")
  end

  def show
  end

  def new
    @task = @list.tasks.new
  end

  def edit
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to task_path
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end
    def set_task
      @task = Task.find(params[:id])
    end
    def task_params
      params.require(:task).permit(:name)
    end
end
