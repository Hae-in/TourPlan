/**
 * 구글 지도 장소 검색
 */

// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.

// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

function initAutocomplete() {
	var map = new google.maps.Map(document.getElementById('map'), {
		center : {
			lat : -33.8688,
			lng : 151.2195
		},
		zoom : 13,
		mapTypeId : 'roadmap'
	});

	// Create the search box and link it to the UI element.
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	// Bias the SearchBox results towards current map's viewport.
	map.addListener('bounds_changed', function() {
		searchBox.setBounds(map.getBounds());
	});

	var markers = [];
	// Listen for the event fired when the user selects a prediction and retrieve
	// more details for that place.
	searchBox.addListener('places_changed', function() {
		var places = searchBox.getPlaces();

		if (places.length == 0) {
			return;
		}

		// Clear out the old markers.
		markers.forEach(function(marker) {
			marker.setMap(null);
		});
		markers = [];

		// For each place, get the icon, name and location.
		var bounds = new google.maps.LatLngBounds();
		places.forEach(function(place) {
			if (!place.geometry) {
				console.log("Returned place contains no geometry");
				return;
			}
			var icon = {
				url : place.icon,
				size : new google.maps.Size(100, 100),
				origin : new google.maps.Point(0, 0),
				anchor : new google.maps.Point(17, 34),
				scaledSize : new google.maps.Size(25, 25)
			};

			// Create a marker for each place.
			markers.push(new google.maps.Marker({
				map : map,
				icon : icon,
				title : place.name,
				position : place.geometry.location
			}));

			if (place.geometry.viewport) {
				// Only geocodes have viewport.
				bounds.union(place.geometry.viewport);
			} else {
				bounds.extend(place.geometry.location);
			}

			//구글 정보 가져오기
			console.dir(place);
			$('[name="lat"]').val(place.geometry.location.lat());			
			$('[name="lon"]').val(place.geometry.location.lng());			
			$('[name="addr"]').val(place.formatted_address);
			//국가, 도시 정보
			for (i = 0; i < place.address_components.length; i++) {				
				if (place.address_components[i].types[0] == "country") {					
					$('[name="country"]').val(place.address_components[i].long_name);
				} else if (place.address_components[i].types[0] == "locality" || place.address_components[i].types[0] == "administrative_area_level_1") {					
					$('[name="city"]').val(place.address_components[i].long_name);
				}
			}
		});
		map.fitBounds(bounds);
	});
}