<%--
  Created by IntelliJ IDEA.
  User: lilyn
  Date: 3/9/2019
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Web Project</title>

    <!-- Custom styles -->
    <link rel="stylesheet" href="css/style.css">

    <!-- jQuery -->
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- Google Map js libraries -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsqIHgOnw6xnDKMJaemjAPIK195fdBpfw&libraries=visualization,places">
    </script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <a class="navbar-brand">Run Management Portal</a>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="sidebar col-xs-3">

            <!-- Tab Navis-->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#create_report" data-toggle="tab">Add Run</a></li>
                <li><a href="#query_report" data-toggle="tab">Query</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content ">
                <!-- Create Report Tab Panel -->
                <div class="tab-pane active" id="create_report">
                    <form id = "create_report_form">
                        <div><label>Race Name:&nbsp</label><input placeholder="Race Name" name="race_name"></div>
                        <div><label>City:&nbsp</label><input placeholder="City Name" name="city"></div>

                        <div><label>Month:</label>
                            <select name="month_name">
                                <option value="">Month of the Run</option>
                                <option value="January">January</option>
                                <option value="February">February</option>
                                <option value="March">March</option>
                                <option value="April">April</option>
                                <option value="May">May</option>
                                <option value="June">June</option>
                                <option value="July">July</option>
                                <option value="August">August</option>
                                <option value="September">September</option>
                                <option value="October">October</option>
                                <option value="November">November</option>
                                <option value="December">December</option>
                            </select>
                        </div>

                        <div><label>State:</label>
                            <select name="state_name">
                                <option value="">Select the state</option>
                                <option value="Alabama">Alabama</option>
                                <option value="Alaska">Alaska</option>
                                <option value="Arizona">Arizona</option>
                                <option value="Arkansas">Arkansas</option>
                                <option value="California">California</option>
                                <option value="Colorado">Colorado</option>
                                <option value="Connecticut">Connecticut</option>
                                <option value="Delaware">Delaware</option>
                                <option value="Florida">Florida</option>
                                <option value="Georgia">Georgia</option>
                                <option value="Hawaii">Hawaii</option>
                                <option value="Idaho">Idaho</option>
                                <option value="Illinois">Illinois</option>
                                <option value="Indiana">Indiana</option>
                                <option value="Iowa">Iowa</option>
                                <option value="Kansas">Kansas</option>
                                <option value="Kentucky">Kentucky</option>
                                <option value="Louisiana">Louisiana</option>
                                <option value="Maine">Maine</option>
                                <option value="Maryland">Maryland</option>
                                <option value="Massachusetts">Massachusetts</option>
                                <option value="Michigan">Michigan</option>
                                <option value="Minnesota">Minnesota</option>
                                <option value="Mississippi">Mississippi</option>
                                <option value="Missouri">Missouri</option>
                                <option value="Montana">Montana</option>
                                <option value="Nebraska">Nebraska</option>
                                <option value="Nevada">Nevada</option>
                                <option value="New Hampshire">New Hampshire</option>
                                <option value="New Jersey">New Jersey</option>
                                <option value="New Mexico">New Mexico</option>
                                <option value="New York">New York</option>
                                <option value="North Carolina">North Carolina</option>
                                <option value="North Dakota">North Dakota</option>
                                <option value="Ohio">Ohio</option>
                                <option value="Oklahoma">Oklahoma</option>
                                <option value="Oregon">Oregon</option>
                                <option value="Pennsylvania">Pennsylvania</option>
                                <option value="Rhode Island">Rhode Island</option>
                                <option value="South Carolina">South Carolina</option>
                                <option value="South Dakota">South Dakota</option>
                                <option value="Tennessee">Tennessee</option>
                                <option value="Texas">Texas</option>
                                <option value="Utah">Utah</option>
                                <option value="Vermont">Vermont</option>
                                <option value="Virginia">Virginia</option>
                                <option value="Washington">Washington</option>
                                <option value="West Virginia">West Virginia</option>
                                <option value="Wisconsin">Wisconsin</option>
                                <option value="Wyoming">Wyoming</option>
                            </select>
                        </div>
                        <div><label>Marathon</label>
                            <label><input type="radio" name="mara_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="mara_type" value="FALSE" checked="checked">&nbspNo</label>
                        </div>
                        <div><label>Half Marathon</label>
                            <label><input type="radio" name="half_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="half_type" value="FALSE" checked="checked">&nbspNo</label>
                        </div>
                        <div><label>10k</label>
                            <label><input type="radio" name="tenk_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="tenk_type" value="FALSE" checked="checked">&nbspNo</label>
                        </div>
                        <div><label>5k</label>
                            <label><input type="radio" name="fivek_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="fivek_type" value="FALSE" checked="checked">&nbspNo</label>
                        </div>
                        <div><label>Kids Run</label>
                            <label><input type="radio" name="kid_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="kid_type" value="FALSE" checked="checked">&nbspNo</label>
                        </div>
                        <div><label>Relay</label>
                            <label><input type="radio" name="relay_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="relay_type" value="FALSE" checked="checked">&nbspNo</label>
                        </div>
                        <div><label>Address:</label>
                            <input id="autocomplete" placeholder="Address" >
                        </div>
                        <%--<div><label>Comment:&nbsp</label><input placeholder="Additional message" name="message"></div>--%>
                        <button type="submit" class="btn btn-default" id="report_submit_btn">
                            <span class="glyphicon glyphicon-cloud-upload"></span> Create
                        </button>
                    </form>
                </div>

                <!-- Query Report Tab Panel -->
                <div class="tab-pane" id="query_report">
                    <form id = "query_report_form">
                        <div><label>Report Type:</label>
                            <select onchange="" name="report_type">
                                <option value="fivek_type">5K</option>
                                <option value="tenk_type">10K</option>
                                <option value="relay_type">Relay</option>
                                <option value="half_type">Half  Marathon</option>
                                <option value="mara_type">Full  Marathon</option>
                                <option value="all" selected="selected">All</option>
                            </select>
                        </div>
                        <div><label>Month:</label>
                            <select name="month_name">
                                <option value="January">January</option>
                                <option value="February">February</option>
                                <option value="March">March</option>
                                <option value="April">April</option>
                                <option value="May">May</option>
                                <option value="June">June</option>
                                <option value="July">July</option>
                                <option value="August">August</option>
                                <option value="September">September</option>
                                <option value="October">October</option>
                                <option value="November">November</option>
                                <option value="December">December</option>
                                <option value="all" selected="selected">All</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-default">
                            <span class="glyphicon glyphicon-cloud-download"></span> Display Results
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div id="map-canvas" class="col-xs-9"></div>

    </div>
</div>

<script src="js/loadform.js"></script>
<script src="js/loadmap.js"></script>

</body>
</html>