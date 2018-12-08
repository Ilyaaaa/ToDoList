class TasksController < ApplicationController
    def index
        session_exsists_check
        @tasks = Task.where(user_id: session[:user_id])
        @task = Task.new
    end

    def get
        session_exsists_check
        @task = Task.find(params[:id])
    end

    def get_all
        
    end

    def create
        @task = Task.new(task_params)

        @errors = Array.new
        if !@task.save
            @task.errors.full_messages.each do |msg|
                @errors.push(msg)
        end
    end 
    end

    def edit
        @task = Task.find(params[:id])

        @errors = Array.new
        if !@task.update(task_params)
            @task.errors.full_messages.each do |msg|
                @errors.push(msg)
            end
        end
    end

    def delete
        @task = Task.find(params[:id])
        @task.destroy
    end

    private def task_params
        params.require(:task).permit(:user_id, :title, :description, :priority, :due_date)
    end
    
    
    private def session_exsists_check
        if session[:user_id] == nil
            redirect_to sign_in_path
        end
    end
end
