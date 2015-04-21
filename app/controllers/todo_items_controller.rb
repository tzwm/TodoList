class TodoItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :initial_todo

  def index
    @items = @todo_list.todo_items.map do |item|
      {title: item.title,
       done: item.done,
       next_id: item.next_id}
    end
  end

  def create
    @todo_item = @todo_list.todo_items.build todo_item_parmas

    if @todo_item.save
      render json: {status: "success"}
    else
      render json: {status: "error", message: @todo_item.errors.full_messages}
    end
  end

  private

  def todo_item_parmas
    params.permit(:title)
  end

  def initial_todo
    @todo_list = current_user.todo_list
    if @todo_list.blank?
      @todo_list = current_user.create_todo_list
    end
  end
end
