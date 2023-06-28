Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root  "weather_report#index"

  post  "weather_report/address", controller: "weather_report", action: :address, as: :weather_address
  get   "weather_report/:zipcode", controller: "weather_report", action: :zipcode, as: :weather_zipcode
end
