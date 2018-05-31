defmodule ExampleAppWeb.PageControllerTest do
  use ExampleAppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Example App"
  end
end
