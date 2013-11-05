class TodosController < ApplicationController
  def index
    if user_signed_in?
      @todos = Todo.all
    else 
      @todos = []
    end
  end

  def show
      @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(params[:todo])
    if @todo.save
      redirect_to todos_path  
    else
      render 'new'
    end

  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(params[:todo])
      redirect_to todo_path(@todo.id)
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end
end
