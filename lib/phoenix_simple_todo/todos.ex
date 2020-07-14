defmodule PhoenixSimpleTodo.Todos do
  import Ecto.Query, warn: false
  alias PhoenixSimpleTodo.Repo
  alias PhoenixSimpleTodo.Todos.{Category, TodoItem}

  def list_categories do
    Repo.all(Category)
  end

  def get_category!(id), do: Repo.get!(Category, id)

  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  def list_todo_items do
    Repo.all(TodoItem)
  end

  def get_todo_item!(id), do: Repo.get!(TodoItem, id)

  def create_todo_item(attrs \\ %{}) do
    %TodoItem{}
    |> TodoItem.changeset(attrs)
    |> Repo.insert()
  end

  def update_todo_item(%TodoItem{} = todo_item, attrs) do
    todo_item
    |> TodoItem.changeset(attrs)
    |> Repo.update()
  end

  def delete_todo_item(%TodoItem{} = todo_item) do
    Repo.delete(todo_item)
  end

  def change_todo_item(%TodoItem{} = todo_item, attrs \\ %{}) do
    TodoItem.changeset(todo_item, attrs)
  end
end
