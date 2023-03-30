class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category
    def index
       @tasks = @category.tasks
    end

    def show
        @task = @category.tasks.find(params[:id])
    end
    
    def new
        @task = @category.tasks.new
    end

    def create
        @task = @category.tasks.new(task_params)
        if @task.save
            
          redirect_to category_tasks_path(@category), notice: "Task was successfully created."
        else
          puts "NOT SAVE"
          render :new
        end
      end

      def edit
        @task = @category.tasks.find(params[:id])
      end

    def update
        @task = @category.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to category_tasks_path
        else
            puts "Not Patched"
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
        params.require(:task).permit(:title, :description, :deadline, :status)
    end

    def get_category
        @category = Category.find(params[:category_id])
    end

    def params_wo_require
        params.permit(:title, :description, :deadline, :status)
    end
end
