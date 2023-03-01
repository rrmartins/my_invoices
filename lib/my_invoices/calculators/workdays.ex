defmodule MyInvoices.Calculators.Workdays do
  def calculate_workdays(lastday, month \\ Date.utc_today().month, year \\ Date.utc_today().year) do
    1..lastday
    |> Enum.map(fn day ->
      {:ok, d} = Date.new(year, month, day)
      d
    end)
    |> Enum.count(fn d -> !weekend?(d) end)
  end

  def calculate_workdays_in_a_year(year \\ Date.utc_today().year) do
    1..12
    |> Enum.map(fn m ->
      :calendar.last_day_of_the_month(year, m)
      |> calculate_workdays(m, year)
    end)
    |> Enum.sum()
  end

  def calculate_workdays_next_month() do
    month = Date.utc_today().month

    Date.utc_today().year
    |> :calendar.last_day_of_the_month(month)
    |> calculate_workdays(month)
  end

  def calculate_workdays_in_a_month(
        month \\ Date.utc_today().month,
        year \\ Date.utc_today().year
      ) do
    year
    |> :calendar.last_day_of_the_month(month)
    |> calculate_workdays(month, year)
  end

  defp weekend?(date) do
    weekday =
      date
      |> Date.to_erl()
      |> :calendar.day_of_the_week()

    weekday > 5
  end
end
