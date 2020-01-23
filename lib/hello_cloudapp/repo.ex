defmodule HelloCloudapp.Repo do
  use Ecto.Repo,
    otp_app: :hello_cloudapp,
    adapter: Ecto.Adapters.Postgres
end
