class TasksController < ApplicationController
    before_action :get_category
    def index
       @tasks = @category.tasks.all
    end
    def show
        @category = Category.find(params[:category_id])
        @tasks = @category.tasks
    end
    

    def new
        @category = Category.find(params[:category_id])
        @task = @category.tasks.create(task_params)
    end

    def create
        @category = Category.find(params[:category_id])
        @task = @category.tasks.create(task_params)
        if @task.save
          redirect_to category_tasks_path(@category), notice: "Task was successfully created."
        else
          render :new
        end
      end

    def edit 
        @task = @category.tasks.find(params[:id])
    end

    def update
        @tasks = @category.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to category_path(@category)
        else
            render :edit
        end
    end

    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_tasks_path
    end
    private
    def task_params
        params.fetch(:task, {}).permit(:title, :description, :deadline)
    end

    def get_category
        @category = Category.find(params[:category_id])
    end
end
