class TodosController < ApplicationController

  before_action :set_todo, only: %w[edit update destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  
  def create 
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to new_todo_path, notice: 'Successfully Created!'
    else
   
      render :new
    end
  end


  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    end
  end

  def destroy 
    if @todo.destroy
      redirect_to todos_path
    end
  end

  
  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title)
  end
end
