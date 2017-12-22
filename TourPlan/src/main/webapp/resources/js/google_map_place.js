/**
 * 구글 지도 장소 검색
 * https://developers.google.com/maps/documentation/javascript/examples/?hl=ko
 */

//기본값 설정
var mode = "insert";
var latVal = -33.8688;
var lngVal = 151.2195;
var placeName = '장소명';
var contentString = '<div><h1 id="firstHeading" class="firstHeading">장소명</h1>'+
'<div id="bodyContent"><p>설명</p></div>'+
'</div>';

if ($('#lat').val() != "") {
	latVal = parseFloat($('#lat').val());
}
if ($('#lng').val() != "") {
	lngVal = parseFloat($('#lng').val());
}
if ($('#lat').val() != "" && $('#lng').val() != "") {
	mode = "update";
}
if ($('#placeName').val() != "") {
	placeName = $('#placeName').val();
	contentString = '<div><h1 id="firstHeading" class="firstHeading">'+$('#placeName').val()+'</h1>'+
	'<div id="bodyContent"><p>'+$('#placeContent').val()+'</p></div>'+
	'</div>';
}

var placePoint = {
	lat : latVal,
	lng : lngVal
};

// Info windows
function initMap() {        
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: placePoint
  });

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  var marker = new google.maps.Marker({
    position: placePoint,
    map: map,
    title: placeName
  });
  
  infowindow.open(map, marker);
}

//Places search box
function initAutocomplete() {
	var map = new google.maps.Map(document.getElementById('map'), {
		center : placePoint,
		zoom : 13,
		mapTypeId : 'roadmap'
	});

	//시작 : 마커가 있을 경우 표시
	if(mode == "update") {
		var infowindow = new google.maps.InfoWindow({
			content : contentString
		});
	
		var marker = new google.maps.Marker({
			position : placePoint,
			map : map,
			title : placeName
		});
	
		infowindow.open(map, marker);
	}

	// Create the search box and link it to the UI element.
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	// Bias the SearchBox results towards current map's viewport.
	map.addListener('bounds_changed', function() {
		searchBox.setBounds(map.getBounds());
	});

	var markers = [];
	var infowindows = [];
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
		
		// marker, infowindow 창닫기
		//marker.setMap(null);
		//infowindow.close();		

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
			var marker = new google.maps.Marker({
				map : map,
				title : place.name,
				position : place.geometry.location
			});
			
			var infowindow = new google.maps.InfoWindow({
				content : '<div><h1 id="firstHeading" class="firstHeading">'+place.name+'</h1>'+
				'</div>'
			});
			
			infowindow.open(map, marker);
			
		    markers.push(marker);
		    infowindows.push(infowindow);

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