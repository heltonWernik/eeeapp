defmodule Eeeapp.AccountsTest do
  use Eeeapp.DataCase

  alias Eeeapp.Accounts
  alias Eeeapp.Accounts.Player

  @create_attrs %{score: 42, username: "some username"}
  @update_attrs %{score: 43, username: "some updated username"}
  @invalid_attrs %{score: nil, username: nil}

  def fixture(:player, attrs \\ @create_attrs) do
    {:ok, player} = Accounts.create_player(attrs)
    player
  end

  test "list_players/1 returns all players" do
    player = fixture(:player)
    assert Accounts.list_players() == [player]
  end

  test "get_player! returns the player with given id" do
    player = fixture(:player)
    assert Accounts.get_player!(player.id) == player
  end

  test "create_player/1 with valid data creates a player" do
    assert {:ok, %Player{} = player} = Accounts.create_player(@create_attrs)
    assert player.score == 42
    assert player.username == "some username"
  end

  test "create_player/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Accounts.create_player(@invalid_attrs)
  end

  test "update_player/2 with valid data updates the player" do
    player = fixture(:player)
    assert {:ok, player} = Accounts.update_player(player, @update_attrs)
    assert %Player{} = player
    assert player.score == 43
    assert player.username == "some updated username"
  end

  test "update_player/2 with invalid data returns error changeset" do
    player = fixture(:player)
    assert {:error, %Ecto.Changeset{}} = Accounts.update_player(player, @invalid_attrs)
    assert player == Accounts.get_player!(player.id)
  end

  test "delete_player/1 deletes the player" do
    player = fixture(:player)
    assert {:ok, %Player{}} = Accounts.delete_player(player)
    assert_raise Ecto.NoResultsError, fn -> Accounts.get_player!(player.id) end
  end

  test "change_player/1 returns a player changeset" do
    player = fixture(:player)
    assert %Ecto.Changeset{} = Accounts.change_player(player)
  end
end
