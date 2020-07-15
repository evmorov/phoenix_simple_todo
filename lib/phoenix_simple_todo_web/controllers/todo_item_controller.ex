defmodule PhoenixSimpleTodoWeb.TodoItemController do
  use PhoenixSimpleTodoWeb, :controller

  alias PhoenixSimpleTodo.Todos
  alias PhoenixSimpleTodo.Todos.TodoItem

  def index(conn, _params) do
    todo_items = Todos.list_todo_items()
    render(conn, "index.html", todo_items: todo_items)
  end

  def new(conn, _params) do
    changeset = Todos.change_todo_item(%TodoItem{})
    categories = Todos.categories_for_todo_form()
    render(conn, "new.html", changeset: changeset, categories: categories)
  end

  def create(conn, %{"todo_item" => todo_item_params}) do
    case Todos.create_todo_item(todo_item_params) do
      {:ok, todo_item} ->
        conn
        |> put_flash(:info, "Todo item created successfully.")
        |> redirect(to: Routes.todo_item_path(conn, :show, todo_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_item = Todos.get_todo_item!(id)
    render(conn, "show.html", todo_item: todo_item)
  end

  def edit(conn, %{"id" => id}) do
    todo_item = Todos.get_todo_item!(id)
    changeset = Todos.change_todo_item(todo_item)
    categories = Todos.categories_for_todo_form()
    render(conn, "edit.html", todo_item: todo_item, changeset: changeset, categories: categories)
  end

  def update(conn, %{"id" => id, "todo_item" => todo_item_params}) do
    todo_item = Todos.get_todo_item!(id)

    case Todos.update_todo_item(todo_item, todo_item_params) do
      {:ok, todo_item} ->
        conn
        |> put_flash(:info, "Todo item updated successfully.")
        |> redirect(to: Routes.todo_item_path(conn, :show, todo_item))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", todo_item: todo_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_item = Todos.get_todo_item!(id)
    {:ok, _todo_item} = Todos.delete_todo_item(todo_item)

    conn
    |> put_flash(:info, "Todo item deleted successfully.")
    |> redirect(to: Routes.todo_item_path(conn, :index))
  end
end
