defmodule Eeeapp.Products.Game do
  use Ecto.Schema

  schema "products_games" do
    field :author_id, :integer
    field :description, :string
    field :title, :string

    timestamps()
  end
end
