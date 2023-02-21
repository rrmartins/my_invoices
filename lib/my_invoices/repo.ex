defmodule MyInvoices.Repo do
  use Ecto.Repo,
    otp_app: :my_invoices,
    adapter: Ecto.Adapters.Postgres
end
