defmodule Eeeapp.Web.PlayerSessionController do
  use Eeeapp.Web, :controller

def new(conn, _) do
  render conn, "new.html"
end

def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
  case Eeeapp.Web.PlayerAuthController.login_by_username_and_pass(conn, user, pass, repo: Eeeapp.Repo) do
    {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination.")
        |> render("new.html") end
      end

  def delete(conn, _) do
        conn
        |> Eeeapp.Web.PlayerAuthController.logout()
        |> redirect(to: player_session_path(conn, :new))
      end
end
