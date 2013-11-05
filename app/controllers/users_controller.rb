class UsersController < ApplicationController
  #index - shows all Users
  def index
    @users = User.all
  end

  #new and create - create a new user
  # def new
  # 	@user = User.new
  # end

  # def create
  # 	@user = User.new(params[:user])
  # 	if @user.save
  # 		redirect_to users_path
  # 	else
  #     render 'new'
  # 	end
  # end



  #show - shows a specific user based on the user_id
  def show
    @user = User.find(params[:id])
  end

  #edit and update - edit a user that was created previously
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  #delete a user
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end
