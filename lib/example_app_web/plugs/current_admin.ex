defmodule ExampleAppWeb.Plug.CurrentAdmin do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    assign(
      conn,
      :current_admin,
      ExampleApp.Guardian.Plug.current_resource(conn)
    )
  end
end
