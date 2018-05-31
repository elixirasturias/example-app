defmodule ExampleAppWeb.Admin.DashboardController do
  use ExampleAppWeb, :controller

  alias ExampleApp.Accounts.Administrator
  alias ExampleApp.Repo

  def index(conn, _params) do
    with administrators <- Repo.aggregate(Administrator, :count, :id) do
      render(conn, "index.html", administrators: administrators)
    end
  end
end
