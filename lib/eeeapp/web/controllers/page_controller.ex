defmodule Eeeapp.Web.PageController do
  use Eeeapp.Web, :controller

  plug :authenticate when action in [:index]

  def index(conn, _params) do
    render conn, "index.html"
  end

def game(conn, _params) do
    render conn, "game.html"
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user() do
    conn
else
    conn
    |> put_flash(:error, "You must be logged in to access that page.")
    |> redirect(to: player_path(conn, :new))
    |> halt()
    end
  end
end
