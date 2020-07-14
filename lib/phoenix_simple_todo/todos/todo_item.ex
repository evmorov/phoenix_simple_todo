defmodule PhoenixSimpleTodo.Todos.TodoItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_items" do
    field :text, :string
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(todo_item, attrs) do
    todo_item
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
