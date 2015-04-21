class TodoItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo_lit = current_user.todo_list
    if @todo_lit.blank?
      @todo_lit = current_user.create_todo_list
    end
  end
end
