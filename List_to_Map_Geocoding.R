library(ggmap)

# Loading list of addresses from CSV to data frame (easiest way to work).
# The main goal is having a list including enough data to be recognised by the geocoding tool and keeping other parameters for segmentation on the map.
# If other sources are required (DB or scrapped web content), change this line for the code required for the connection.
schools_madrid <- read.csv("colegios_madrid.csv", sep = ",", encoding = "ISO", stringsAsFactors = FALSE, header = TRUE)

# Paste Street and city in order to have a more detailed address to query the geocoder 
schools_madrid$ADDRESS <- paste(schools_madrid$DOMICILIO,schools_madrid$MUNICIPIO)

# Geocoding API Key from Google Cloud Platform (Paid but some free credit available at signing up)
# Info on how to get an API key here: https://developers.google.com/maps/documentation/geocoding/get-api-key
register_google(key = "your_Geocoding_API_key_here")

# Loop for querying each different address and add latitude, longitude and geoAddress data to 
for(i in 1:nrow(schools_madrid))
{
  result <- geocode(schools_madrid$ADDRESS[i], output = "latlona", source = "google")
  schools_madrid$lon[i] <- as.numeric(result[1])
  schools_madrid$lat[i] <- as.numeric(result[2])
  schools_madrid$geoAddress[i] <- as.character(result[3])
}

write.csv(schools_madrid,file = "colegios_madrid_location.csv")
