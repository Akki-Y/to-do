class CompletionsController < ApplicationController
  before_action :set_todo, only: [:update]

  def update
    @todo.completed = !@todo.completed
    if @todo.save
      redirect_to todos_path, notice: 'Todo completion status updated.'
    else
      redirect_to todos_path, alert: 'Failed to update todo completion status.'
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
