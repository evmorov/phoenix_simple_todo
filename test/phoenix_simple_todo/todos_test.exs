defmodule PhoenixSimpleTodo.TodosTest do
  use PhoenixSimpleTodo.DataCase

  alias PhoenixSimpleTodo.Todos

  describe "categories" do
    alias PhoenixSimpleTodo.Todos.Category

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Todos.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Todos.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Todos.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Todos.create_category(@valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Todos.update_category(category, @update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_category(category, @invalid_attrs)
      assert category == Todos.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Todos.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Todos.change_category(category)
    end
  end

  describe "todo_items" do
    alias PhoenixSimpleTodo.Todos.TodoItem

    @valid_attrs %{text: "some text"}
    @update_attrs %{text: "some updated text"}
    @invalid_attrs %{text: nil}

    def todo_item_fixture(attrs \\ %{}) do
      {:ok, todo_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Todos.create_todo_item()

      todo_item
    end

    test "list_todo_items/0 returns all todo_items" do
      todo_item = todo_item_fixture()
      assert Todos.list_todo_items() == [todo_item]
    end

    test "get_todo_item!/1 returns the todo_item with given id" do
      todo_item = todo_item_fixture()
      assert Todos.get_todo_item!(todo_item.id) == todo_item
    end

    test "create_todo_item/1 with valid data creates a todo_item" do
      assert {:ok, %TodoItem{} = todo_item} = Todos.create_todo_item(@valid_attrs)
      assert todo_item.text == "some text"
    end

    test "create_todo_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_todo_item(@invalid_attrs)
    end

    test "update_todo_item/2 with valid data updates the todo_item" do
      todo_item = todo_item_fixture()
      assert {:ok, %TodoItem{} = todo_item} = Todos.update_todo_item(todo_item, @update_attrs)
      assert todo_item.text == "some updated text"
    end

    test "update_todo_item/2 with invalid data returns error changeset" do
      todo_item = todo_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_todo_item(todo_item, @invalid_attrs)
      assert todo_item == Todos.get_todo_item!(todo_item.id)
    end

    test "delete_todo_item/1 deletes the todo_item" do
      todo_item = todo_item_fixture()
      assert {:ok, %TodoItem{}} = Todos.delete_todo_item(todo_item)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_todo_item!(todo_item.id) end
    end

    test "change_todo_item/1 returns a todo_item changeset" do
      todo_item = todo_item_fixture()
      assert %Ecto.Changeset{} = Todos.change_todo_item(todo_item)
    end
  end
end
