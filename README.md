# Address List to Geocoding
Brief script to obtain latitude and longitude data from a list of addresses in order to use them on map visualisations 


## - Main goal:
In many cases, map visualisations can be much more powerful while presenting geographical data than a full or a summarised list of records. The main goal of this script is to add latitude and longitude information in an automated way for a set of records where only address is available, in order to use as a basis for creating maps on visualisation tools.

As an example, a .csv files containing data for schools in Madrid is the main dataset chosen for this example. Any other source or file including addresses could be used, if the data can be transformed into a similar data frame.


## - Potential uses:

- Academical: Create visual materials in the form of maps for presentations and articles where geographical criteria could be of relevance.
 
- Business: Create maps for own store locations, competitors or sales amounts by locations, to be used on meetings os as quick working documents.

- Measurement: Transform physical addresses data into numerical lat and long data, making easier to calculate distances and clustering locations.


## - Example of needs solved by this script:
The script was created as a cooperation with an academical research on schools. The person in charged had a list of more than 150 schools including some custom made segmentations, and wanted to show them in different maps. In order to save the time to obtain geocoding data for each one of them manually, this script was intended to query the Google Geocoding APP for each one of them and automatise the task. 


## - Requirements:
- R
- Packages: ggmap (D. Kahle and H. Wickham. ggmap: Spatial Visualization with ggplot2. The R Journal, 5(1), 144-161. URL http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)
-  Geocoding API key from Google Cloud Console. Info on how to get it on https://developers.google.com/maps/documentation/geocoding/get-api-key (charges apply - free credit available at sign up)

## - How does it work?:
- Insert the Geocoding API Key you can obtain on Google Cloud Console (details on the link above).
- Use the .csv file provided as an example or add your own list as a data frame.
- Paste together all the fields that could be helpful to let Google find the right place, in case there are different fields for address, street number, postal code, city or country. Try to create a new field with the most fully detailed address you can get from the existing fields.
- The loop will be querying the Geocoding APP for every row and adding new columns to the data frame with values lon, lat and geoAddress.
- Download it to .csv for using on tools where maps can be created like PowerBI or use the data frame together with some other R mapping packages in order to create visualisations.
- Check the map and look for wrong geolocalisations. As the API is guessing from an address, in some cases a different location with a similar name can be mistankely chosen. Most of those could be spotted easily.
- **WATCH OUT!** : Google Cloud Console charges a fee per use. For testing purposes, the free credits provided when opening the account should be enough, but if you work with huge datasets or use it very often, you could be charged according to the use. 


## - Example of final results:
This map was created on PowerBI using the results of the data frame modified by the script. A segmentation between public and private schools available on the original list has been used as a basis for the colours of the different dots.
![Ejemplo geolocalización](/Geocoding%20Example.PNG)
