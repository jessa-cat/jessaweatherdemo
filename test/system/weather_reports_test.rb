require "application_system_test_case"

class WeatherReportsTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome

  # this is a stand-in for more complex test that might apply to the app's landing page
  test "input form renders" do
    visit root_path
    assert_selector "input", id: "address"
  end

  # result page loads and reports the location name correctly
  test "names location" do
    visit weather_zipcode_path zipcode: "94901"
    assert_selector "h1", text: "Weather for San Rafael 94901"
  end

  # result page shows the temp
  test "reports weather" do
    visit weather_zipcode_path zipcode: "94901"
    assert_selector "div#currtemp", text: "Currently " # this is a stub
    # A real version of this test would mock the weather API response with
    # a known, canned response.  If, for example, the mock set the temp to
    # '80' that feels like '85', we'd test for the string
    # "Currently 80°, feels like 85°"
    # This way, we are testing our ability to read and handle the API's response
    # but not wasting cycles testing the API itself (that's its responsibility).
    # In more complex application, the API and cache negotiation would ideally
    # in a unit-testable method.
  end

  ## further good tests to have:
  # test each displayed value (wind, humidity, etc)
  # test error message for non-US addresses
  # test error message for when user enters an invalid address
  # test graceful handling of geo and weather API failures by mocking the API errors
end
