# Jessa's Weather Report Take-Home

Caveats and considerations:
* Accepts an address, or address fragment, as input.  Since weather data is pulled by zip code, that’s the minimum data needed for a result.
* Because the caching requirement is to key by zip code, I interpreted this to mean that only addresses in the USA should be supported.  Users will see an error if they try a non-US address
* Expanding support to other countries would require something like “country/post code”, or adopting a [global grid scheme](https://en.wikipedia.org/wiki/Discrete_global_grid)
* [Not all addresses or locations in the US actually have a zip code](https://www.unitedstateszipcodes.org/images/zip-codes/places-without-zip-codes.png).  Trying such an address will return an error “can’t find address”
* My API key is in the app config.  This is purely a shortcut taken for the exercise.  In a real application I would NEVER check in a secret like an API key (or password, etc) into source code.  That stuff should be managed separately, with coordination as needed from DevOps and Security
* Additional notes are in code comments
