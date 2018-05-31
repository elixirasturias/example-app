defmodule ExampleApp.Guardian do
  use Guardian, otp_app: :example_app
  import ExampleAppWeb.Gettext
  alias Comeonin.Bcrypt
  alias ExampleApp.Accounts

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]

    resource = Accounts.get_administrator!(id)
    {:ok, resource}
  end

  def authenticate_user(email, password) do
    email
    |> Accounts.get_administrator_by_email()
    |> check_password(password)
  end

  defp check_password(nil, _),
    do: {:error, gettext("Incorrect username or password")}

  defp check_password(user, password) do
    case Bcrypt.checkpw(password, user.encrypted_password) do
      true -> {:ok, user}
      false -> {:error, gettext("Incorrect username or password")}
    end
  end
end
