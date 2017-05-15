defmodule Eeeapp.Web.PageControllerTest do
  use Eeeapp.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Players"
  end
end
