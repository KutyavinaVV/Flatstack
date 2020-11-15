class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.actual
  end

  # GET /tasks/1
  def show
    @task = Task.find(params["id"])
  end

  # GET /tasks/new
  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params["id"])
  end

  # POST /tasks
  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_params.merge(list_id: params[:list_id]))

    if @task.save
      redirect_to list_task_path(params['list_id'], @task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    @list = List.find(params[:list_id])

      if @task.update(task_params)
        redirect_to list_task_path(params['list_id'], @task), notice: 'Task was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to list_path(params[:list_id]), notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title)
    end
end
