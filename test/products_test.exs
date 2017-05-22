defmodule Eeeapp.ProductsTest do
  use Eeeapp.DataCase

  alias Eeeapp.Products
  alias Eeeapp.Products.Game

  @create_attrs %{author_id: 42, description: "some description", title: "some title"}
  @update_attrs %{author_id: 43, description: "some updated description", title: "some updated title"}
  @invalid_attrs %{author_id: nil, description: nil, title: nil}

  def fixture(:game, attrs \\ @create_attrs) do
    {:ok, game} = Products.create_game(attrs)
    game
  end

  test "list_games/1 returns all games" do
    game = fixture(:game)
    assert Products.list_games() == [game]
  end

  test "get_game! returns the game with given id" do
    game = fixture(:game)
    assert Products.get_game!(game.id) == game
  end

  test "create_game/1 with valid data creates a game" do
    assert {:ok, %Game{} = game} = Products.create_game(@create_attrs)
    assert game.author_id == 42
    assert game.description == "some description"
    assert game.title == "some title"
  end

  test "create_game/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Products.create_game(@invalid_attrs)
  end

  test "update_game/2 with valid data updates the game" do
    game = fixture(:game)
    assert {:ok, game} = Products.update_game(game, @update_attrs)
    assert %Game{} = game
    assert game.author_id == 43
    assert game.description == "some updated description"
    assert game.title == "some updated title"
  end

  test "update_game/2 with invalid data returns error changeset" do
    game = fixture(:game)
    assert {:error, %Ecto.Changeset{}} = Products.update_game(game, @invalid_attrs)
    assert game == Products.get_game!(game.id)
  end

  test "delete_game/1 deletes the game" do
    game = fixture(:game)
    assert {:ok, %Game{}} = Products.delete_game(game)
    assert_raise Ecto.NoResultsError, fn -> Products.get_game!(game.id) end
  end

  test "change_game/1 returns a game changeset" do
    game = fixture(:game)
    assert %Ecto.Changeset{} = Products.change_game(game)
  end
end
