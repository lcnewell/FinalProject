/**
 * this coordinates with the queryReport function in httpservlet. queryreport pulls request from the user examines the
 * database and displays the results from the query either by month or run type or both.
 */
function queryReport(event) {
    event.preventDefault(); // stop form from submitting normally
    var a = $("#query_report_form").serializeArray();
    a.push({ name: "tab_id", value: "1" });
    a = a.filter(function(item){return item.value != '';});
    var raceType = a[0].value;
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: a,
        success: function(reports) {
            updateMap(reports, raceType);
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}

/**
 * calls the create report form function and creates run event in the database with the data entered in by the user
 */
function createReport(event) {
    event.preventDefault(); // stop form from submitting normally

    var a = $("#create_report_form").serializeArray();
    a.push({ name: "tab_id", value: "0" });
    a.push({ name: "latitude", value: place.geometry.location.lat()});
    a.push({ name: "longitude", value: place.geometry.location.lng()});
    a = a.filter(function(item){return item.value != '';});

    console.log(a)
    $.ajax({
        url: 'HttpServlet',
        type: 'POST',
        data: a,
        success: function(reports) {
            $.ajax({
                url: 'HttpServlet',
                type: 'POST',
                data: { "tab_id": "1"},
                success: function(reports) {
                    mapInitialization(reports);
                    onPlaceChanged();
                    $("#create_report_form").trigger("reset");

                },
                error: function(xhr, status, error) {
                    alert("An AJAX error occured: " + status + "\nError: " + error);
                }
            });
            alert("The report is successfully submitted!");
        },
        error: function(xhr, status, error) {
            alert("Status: " + status + "\nError: " + error);
        }
    });
}

/**
 * call function upon 'submit'
 */
$("#query_report_form").on("submit",queryReport);
$("#create_report_form").on("submit",createReport);