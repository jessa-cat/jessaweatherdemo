class WeatherReportController < ApplicationController

	# show an empty form
	def index
	end

	def address
		@address = Geocoder.search(params[:address]).first
		# a more robust product might offer the user a list of choices if more than one match was found,
		# possibly as a dropdown, but taking 'first' works for a simple demo with a minimal UI

		if @address && @address.postal_code			
			if !country_supported? @address.country_code
				redirect_to root_url, alert: "Sorry, only US addresses are currently supported" # a production app might factor this string out into a translation file
			else
				# do a full browser redirect, so the user ends up at a bookmarkable page that skips our geo lookup step
				redirect_to action: "zipcode", zipcode: @address.postal_code
			end
		else
			redirect_to root_url, alert: "Could not find your address.  Please try again."
		end
	end

	# show the report for the US zip
	def zipcode
		@zipcode = get_zip
		# do the api lookup
	end

	private

	# get a safe zip code from the GET param
	def get_zip
		# This is a barebones amount of validation to ensure we don't allow malicious
		# users to send the weather API unreasonably large data using our API key.
		# We're still relying upon the API to validate its own input
		params[:zipcode].truncate 10, omission: ''
	end

	# this logic is in its own function so that it can grow and change if more regions become supported
	def country_supported?(code)
		code == "us"
	end
end
