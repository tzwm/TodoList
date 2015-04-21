class TodoItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo_list = current_user.todo_list
    if @todo_list.blank?
      @todo_list = current_user.create_todo_list
    end
    @items = @todo_list.todo_items.map do |item|
      {title: item.title,
       done: item.done,
       next_id: item.next_id}
    end
  end
end
