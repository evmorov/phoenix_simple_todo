defmodule PhoenixSimpleTodoWeb.TodoItemView do
  use PhoenixSimpleTodoWeb, :view

  def category_name(todo_item) do
    if todo_item.category do
      todo_item.category.name
    else
      "-"
    end
  end
end
