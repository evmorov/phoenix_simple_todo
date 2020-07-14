defmodule PhoenixSimpleTodo.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_simple_todo,
    adapter: Ecto.Adapters.Postgres
end
