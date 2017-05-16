defmodule Eeeapp.Accounts.Player do
  use Ecto.Schema

  schema "accounts_players" do
    field :display_name, :string
    field :username, :string
    field :score, :integer
    field :password, :string, virtual: true
    field :password_hash, :string
    
    timestamps()
  end
end
