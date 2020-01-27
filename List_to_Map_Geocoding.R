library(ggmap)

schools_madrid <- read.csv("colegios_madrid.csv", sep = ",", encoding = "ISO", stringsAsFactors = FALSE, header = TRUE)

schools_madrid$ADDRESS <- paste(schools_madrid$DOMICILIO,schools_madrid$MUNICIPIO)

register_google(key = "your_Geocoding_API_key_here")

for(i in 1:nrow(schools_madrid))
{
  result <- geocode(schools_madrid$ADDRESS[i], output = "latlona", source = "google")
  schools_madrid$lon[i] <- as.numeric(result[1])
  schools_madrid$lat[i] <- as.numeric(result[2])
  schools_madrid$geoAddress[i] <- as.character(result[3])
}

write.csv(schools_madrid,file = "colegios_madrid_location.csv")
