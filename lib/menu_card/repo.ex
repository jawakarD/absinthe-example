defmodule MenuCard.Repo do
  use Ecto.Repo,
    otp_app: :menu_card,
    adapter: Ecto.Adapters.Postgres
end
