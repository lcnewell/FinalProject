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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqHMKZS0Z1MYjFJ3YVbWApWVufmQ9Cn_g&libraries=places,visualization"></script>

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
                <li class="active"><a href="#create_report" data-toggle="tab">Add a Race</a></li>
                <li><a href="#query_report" data-toggle="tab">Query</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content ">
                <!-- Create Report Tab Panel -->
                <div class="tab-pane active" id="create_report">
                    <form id = "create_report_form">
                        <div><label>City:&nbsp</label><input placeholder="City Name" name="city"></div>
                        <div><label>Month:&nbsp</label><input placeholder="Month of Run" name="month_name"></div>
                        <div><label>State:&nbsp</label><input placeholder="State" name="state_name"></div>
                        <div><label>Marathon</label>
                            <label><input type="radio" name="mara_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="mara_type" value="FALSE">&nbspNo</label>
                        </div>
                        <div><label>Half Marathon</label>
                            <label><input type="radio" name="half_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="half_type" value="FALSE">&nbspNo</label>
                        </div>
                        <div><label>10k</label>
                            <label><input type="radio" name="tenk_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="tenk_type" value="FALSE">&nbspNo</label>
                        </div>
                        <div><label>5k</label>
                            <label><input type="radio" name="fivek_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="fivek_type" value="FALSE">&nbspNo</label>
                        </div>
                        <div><label>Kids Run</label>
                            <label><input type="radio" name="kid_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="kid_type" value="FALSE">&nbspNo</label>
                        </div>
                        <div><label>Relay</label>
                            <label><input type="radio" name="relay_type" value="TRUE">&nbspYes</label>
                            <label><input type="radio" name="relay_type" value="FALSE">&nbspNo</label>
                        </div>
                        <div><label>Address:</label>
                            <input id="autocomplete" placeholder="Address" >
                        </div>
                        <div><label>Comment:&nbsp</label><input placeholder="Additional message" name="message"></div>
                        <button type="submit" class="btn btn-default" id="report_submit_btn">
                            <span class="glyphicon glyphicon-star"></span> Submit
                        </button>
                    </form>
                </div>

                <!-- Query Report Tab Panel -->
                <div class="tab-pane" id="query_report">
                    <form id = "query_report_form">
                        <div><label>Report Type:</label>
                            <select onchange="" name="report_type">
                                <option value="">Choose Race Type</option>
                                <option value="fivek_type">5K</option>
                                <option value="tenk_type">10K</option>
                                <option value="relay_type">Relay</option>
                                <option value="half_type">Half  Marathon</option>
                                <option value="mara_type">Full  Marathon</option>
                            </select>
                        </div>
                        <div class="additional_msg_div" style="visibility: hidden"><label class="additional_msg"></label>
                            <select class="additional_msg_select" name="resource_or_damage"></select>
                        </div>
                        <button type="submit" class="btn btn-default">
                            <span class="glyphicon glyphicon-star"></span> Submit the query
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