defmodule PhoenixSimpleTodo.Repo.Migrations.CreateTodoItems do
  use Ecto.Migration

  def change do
    create table(:todo_items) do
      add :text, :string
      add :category_id, references(:categories, on_delete: :nilify_all)

      timestamps()
    end

    create index(:todo_items, [:category_id])
  end
end
