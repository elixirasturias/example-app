defmodule ExampleAppWeb.SessionController do
  alias ExampleApp.Guardian
  alias ExampleApp.Guardian.Plug

  use ExampleAppWeb, :controller

  plug(:put_layout, {ExampleAppWeb.Admin.LayoutView, "admin_auth.html"})

  def new(conn, _), do: render(conn, "new.html")

  def create(conn, %{
        "session" => %{
          "email" => email,
          "password" => password
        }
      }) do
    case Guardian.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> Plug.sign_in(user)
        |> put_flash(:success, gettext("Welcome to Example App!"))
        |> redirect(to: page_path(conn, :index))

      {:error, message} ->
        conn
        |> put_flash(:error, message)
        |> redirect(to: session_path(conn, :new))
    end
  end

  def delete(conn, _) do
    conn
    |> Plug.sign_out()
    |> redirect(to: page_path(conn, :index))
  end
end
