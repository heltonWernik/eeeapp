defmodule Eeeapp.Accounts.Player do
  use Ecto.Schema

  schema "accounts_players" do
    field :score, :integer
    field :username, :string

    timestamps()
  end
end
