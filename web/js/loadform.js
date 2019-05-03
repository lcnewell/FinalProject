/**
 * this coordinates with the queryEvent function in httpservlet. queryEvent pulls request from the user examines the
 * database and displays the results from the query either by month or run type or both.
 */
function queryEvent(event) {
    event.preventDefault(); // stop form from submitting normally
    var a = $("#query_event_form").serializeArray();
    a.push({ name: "tab_id", value: "1" });
    a = a.filter(function(item){return item.value != '';});
    var raceType = a[0].value;
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: a,
        success: function(events) {
            generateMap(events, raceType);
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}

/**
 * create the running event calling the createEvent function. Pushes the latitude and longitude along with the tab id.
 */
function createEvent(event) {
    event.preventDefault(); // stop form from submitting normally
    onPlaceChanged();
    var a = $("#create_event_form").serializeArray();
    a.push({ name: "tab_id", value: "0" });
    a.push({ name: "latitude", value: place.geometry.location.lat()});
    a.push({ name: "longitude", value: place.geometry.location.lng()});
    a = a.filter(function(item){return item.value != '';});

    console.log(a)
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: a,
        success: function(events) {
            $.ajax({
                url: 'HttpServlet',
                type: 'POST',
                data: { "tab_id": "1", "race_type": "all", "month_name": "all"},
                success: function(events) {
                    generateMap(events, "all");
                    onPlaceChanged();
                    $("#create_event_form").trigger("reset");
                },
                error: function(xhr, status, error) {
                    alert("An AJAX error occured pulling event data: " + status + "\nError: " + error);
                }
            });
            alert("The event is successfully submitted!");
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}

/**
 * call the respective functions on 'submit'
 */
$("#query_event_form").on("submit",queryEvent);
$("#create_event_form").on("submit",createEvent);