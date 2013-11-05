class TasklistsController < ApplicationController
  def index
    if user_signed_in?
  	 @task_lists = Tasklist.where(user_id: current_user)
    else
      @task_lists = Tasklist.all
    end
  end

  def new
  	@task_list = Tasklist.new
  end

  def create
  	@task_list = Tasklist.new(params[:tasklist])
  	if(@task_list.user_id != current_user.id)
      redirect_to root_path
    else
      if @task_list.save
        Notifications.new_tasklist(@task_list).deliver
    		redirect_to tasklists_path
    	else
    		render 'new'
    	end
    end
  end

  def show
    @task_list = Tasklist.find(params[:id])
  end

  def edit
    @task_list = Tasklist.find(params[:id])
  end

  def update
    @task_list = Tasklist.find(params[:id])
    if @task_list.update_attributes(params[:tasklist])
      redirect_to tasklist_path(@task_list.id)
    else
      render 'edit'
    end
  end

  #delete a user
  def destroy
    @task_list = Tasklist.find(params[:id])
    @task_list.destroy
    redirect_to tasklists_path
  end
end
