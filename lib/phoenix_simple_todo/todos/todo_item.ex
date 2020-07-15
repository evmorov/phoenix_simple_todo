defmodule PhoenixSimpleTodo.Todos.TodoItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixSimpleTodo.Todos.Category

  schema "todo_items" do
    field :text, :string
    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(todo_item, attrs) do
    todo_item
    |> cast(attrs, [:text, :category_id])
    |> validate_required([:text])
  end
end
