package org.webproject.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.SysexMessage;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.webproject.servlet.DBUtility;


@WebServlet("/HttpServlet")
public class HttpServlet extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;


    public HttpServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String tab_id = request.getParameter("tab_id");

        /**
         * This will need some changes. If we decide to stick with the tab_id concept then just names iwll have to be changes.
         * Otherwise probably just delete the "get" option and only allow the "post"
         */
        // create a report
        if (tab_id.equals("0")) {
            System.out.println("A report is submitted!");
            try {
                createReport(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // query reports
        else if (tab_id.equals("1")) {
            try {
                queryReport(request, response);
            } catch (JSONException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    private void createReport(HttpServletRequest request, HttpServletResponse
            response) throws SQLException, IOException {
        DBUtility dbutil = new DBUtility();
        String sql = "";
/**
 * This section will need to be modified to create a post to the new table, "event". Follow the format of the below code to
 * 1. pull fields from the request with request.getParameter()
 * 2. add quotes surrounding the field strings ie. my_string = "'" + my_string + "'";
 * 3. build the actual sql statemend "insert into event (field_1, field_2...) etc"
 * 4. call dbutil.modifyDB with the result and report the status (lines 179-188 ish)
 */

        // create race report
        int id = 0;
        String race_name = request.getParameter("race_name");
        String city = request.getParameter("city");
        String month_name = request.getParameter("month_name");
        String state_name = request.getParameter("state_name");
        String mara_type = request.getParameter("mara_type");
        String half_type = request.getParameter("half_type");
        String tenk_type = request.getParameter("tenk_type");
        String fivek_type = request.getParameter("fivek_type");
        String kid_type = request.getParameter("kid_type");
        String relay_type = request.getParameter("relay_type");
        String lon = request.getParameter("longitude");
        String lat = request.getParameter("latitude");


        ResultSet res_3 = dbutil.queryDB("select id from event order by id DESC limit 1");
        res_3.next();
        id = res_3.getInt(1) + 1;
        System.out.println(id);
        sql = "insert into event (id, race_name, city, month_name, state_name, mara_type, tenk_type, half_type, fivek_type," +
                " kid_type, relay_type, latitude, longitude) values ('" + id + "','" + race_name + "','" + city + "','" + month_name + "','" + state_name + "','" +
                mara_type + "','" + tenk_type + "','" + half_type + "','" + fivek_type + "','" + kid_type + "','" + relay_type + "','" +
                lat + "','" + lon + "')";
        System.out.println(sql);
        dbutil.modifyDB(sql);


        System.out.println("Success! Race has been entered into the database.");

        JSONObject data = new JSONObject();
        try {
            data.put("status", "success");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        response.getWriter().write(data.toString());

    }

    private void queryReport(HttpServletRequest request, HttpServletResponse
            response) throws JSONException, SQLException, IOException {
        JSONArray list = new JSONArray();
/**
 * Follow the format of one of these ifs (i dont b elieve there are multiple cases) and create a select statement with the column
 * names we want to return from the even database
 */

        String raceType = request.getParameter("report_type");
        String month = request.getParameter("month_name");

        String sql = "select * from event";

        if (!raceType.equalsIgnoreCase("all")) {
            sql += " where " + raceType + " = true";
            if (!month.equalsIgnoreCase("all")) {
                sql += " and month_name = '" + month + "'";
            }
        } else if (!month.equalsIgnoreCase("all")) {
            sql += " where month_name = '" + month + "'";
        }

        DBUtility dbutil = new DBUtility();
        ResultSet res = dbutil.queryDB(sql);
        while (res.next()) {
            // add to response
            HashMap<String, String> m = new HashMap<String,String>();
            m.put("race", res.getString("race_name"));
            m.put("city", res.getString("city"));
            m.put("month", res.getString("month_name"));
            m.put("state", res.getString("state_name"));
            m.put("latitude", res.getString("latitude"));
            m.put("longitude", res.getString("longitude"));
            list.put(m);
        }
        response.getWriter().write(list.toString());
    }

    private void queryReportHelper(String sql, JSONArray list, String report_type,
                                   String disaster_type, String resource_or_damage) throws SQLException {
        /**
         * dont need this beginning logic just hte call to dbutil.queryDB.  the while loop is building a response list so we'll want that but will
         * change it to 'put' relevant fields from our query response from the event table
         */
        DBUtility dbutil = new DBUtility();
        if (disaster_type != null) {
            sql += " and disaster_type = '" + disaster_type + "'";
        }
        if (resource_or_damage != null) {
            if (report_type.equalsIgnoreCase("damage")) {
                sql += " and damage_type = '" + resource_or_damage + "'";
            } else {
                sql += " and resource_type = '" + resource_or_damage + "'";
            }
        }
        ResultSet res = dbutil.queryDB(sql);
    }

    public void main() throws JSONException {
    }
}