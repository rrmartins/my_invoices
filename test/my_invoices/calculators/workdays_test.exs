defmodule MyInvoices.Calculators.WorkdaysTest do
  use MyInvoices.DataCase, async: true

  alias MyInvoices.Calculators.Workdays

  describe "calculate_workdays/3" do
    test "when send all params" do
      assert Workdays.calculate_workdays(4, 3, 2023) == 3
      assert Workdays.calculate_workdays(31, 3, 2023) == 23
    end
  end

  describe "calculate_workdays_in_a_year/1" do
    test "when send all params" do
      assert Workdays.calculate_workdays_in_a_year(2023) == 260
      assert Workdays.calculate_workdays_in_a_year(2024) == 262
    end

    test "when not send year params" do
      assert Workdays.calculate_workdays_in_a_year() == 260
    end
  end

  describe "calculate_workdays_in_a_month/2" do
    test "when send all params" do
      assert Workdays.calculate_workdays_in_a_month(4, 2023) == 20
    end
  end
end
