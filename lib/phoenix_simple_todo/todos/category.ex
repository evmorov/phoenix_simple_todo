defmodule PhoenixSimpleTodo.Todos.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixSimpleTodo.Todos.TodoItem

  schema "categories" do
    field :name, :string
    has_many :todo_items, TodoItem

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
