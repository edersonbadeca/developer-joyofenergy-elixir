defmodule ElectricityWeb.PageControllerTest do
  use ElectricityWeb.ConnCase

  test "GET /api/readings/read/smart_meter_01", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 404  ) =~ "Not Found"
  end
end
