
var map;
var place;
var autocomplete;
var infowindow = new google.maps.InfoWindow();
var iconBase =  'img/';
var icons = {
    all: {
        icon: {
            url: iconBase +'runningman.PNG',
            scaledSize: new google.maps.Size(50, 50),
            origin: new google.maps.Point(0,0),
            anchor: new google.maps.Point(0,0)
        }
    },
    fivek_type: {
        icon: {
            url: iconBase +'runningmanblue.PNG',
            scaledSize: new google.maps.Size(50, 50),
            origin: new google.maps.Point(0,0),
            anchor: new google.maps.Point(0,0)
        }
    },
    tenk_type: {
        icon: {
            url: iconBase +'runningmangreen.PNG',
            scaledSize: new google.maps.Size(50, 50),
            origin: new google.maps.Point(0,0),
            anchor: new google.maps.Point(0,0)
        }
    },
    half_type: {
        icon: {
            url: iconBase +'runningmanpurple.PNG',
            scaledSize: new google.maps.Size(50, 50),
            origin: new google.maps.Point(0,0),
            anchor: new google.maps.Point(0,0)
        }
    },
    mara_type: {
        icon: {
            url: iconBase +'runningmanred.PNG',
            scaledSize: new google.maps.Size(50, 50),
            origin: new google.maps.Point(0,0),
            anchor: new google.maps.Point(0,0)
        }
    },
    relay_type: {
        icon: {
            url: iconBase +'runningmanyellow.PNG',
            scaledSize: new google.maps.Size(50, 50),
            origin: new google.maps.Point(0,0),
            anchor: new google.maps.Point(0,0)
        }
    },
};

function initialization() {
    showAllReports();
    initAutocomplete();
}

/**
 * will change data if we don't go with tabs. also change reports to better name
 */
function showAllReports() {
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: { "tab_id": "1", "report_type": "all", "month_name": "all"},
        success: function(reports) {
            generateMap(reports, "all");
        },
        error: function(xhr, status, error) {
            alert("An AJAX error occured: " + status + "\nError: " + error);
        }
    });
}

function generateMap(reports, raceType) {
    var mapOptions = {
        mapTypeId : google.maps.MapTypeId.ROADMAP, // Set the type of Map
    };

    // Render the map within the empty div
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    var bounds = new google.maps.LatLngBounds ();

    $.each(reports, function(i, e) {
        var long = Number(e['longitude']);
        var lat = Number(e['latitude']);
        var latlng = new google.maps.LatLng(lat, long);

        bounds.extend(latlng);

        /**
         * need to add the runner pngs to the project and edit these urls to point to the new images.
         * alter size as needed. change icon names.
         */
        // Create the icon marker
        var contentStr = '<h4>Event Details</h4><hr>';

        /**
         * change icon
         */
        // Create the marker
        var marker = new google.maps.Marker({ // Set the marker
            position : latlng, // Position marker to coordinates
            icon: icons[raceType].icon,
            map : map, // assign the market to our map variable
            customInfo: contentStr,
        });

        // Add a Click Listener to the marker
        google.maps.event.addListener(marker, 'click', function() {
            // use 'customInfo' to customize infoWindow
            infowindow.setContent(marker['customInfo']);
            infowindow.open(map, marker); // Open InfoWindow
        });

    });

    map.fitBounds (bounds);

}

/**
 * we can probably keep everything below here the same for now
 */

function initAutocomplete() {
    // Create the autocomplete object
    autocomplete = new google.maps.places.Autocomplete(document
        .getElementById('autocomplete'));

    // When the user selects an address from the dropdown, show the place selected
    autocomplete.addListener('place_changed', onPlaceChanged);
}

function onPlaceChanged() {
    place = autocomplete.getPlace();
    if (!place.geometry) {
        // User entered the name of a Place that was not suggested and
        // pressed the Enter key, or the Place Details request failed.
        window.alert("No details available for input: '" + place.name + "'");
        return;
    }
    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
        map.fitBounds(place.geometry.viewport);
    } else {
        map.setCenter(place.geometry.location);
        map.setZoom(17);
    }
}

//Execute our 'initialization' function once the page has loaded.
google.maps.event.addDomListener(window, 'load', initialization);