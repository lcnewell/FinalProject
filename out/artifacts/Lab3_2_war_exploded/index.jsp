<%--
  Created by IntelliJ IDEA.
  User: lilyn
  Date: 3/9/2019
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Web Project</title>
  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
<script>
  window.onload = initialize();
  function initialize() {
    $.ajax({
      url: 'HttpServlet',
      type: 'POST',
      success: function(data){
        $.each(data, function(i, name) {
          alert("key: " + i + ", value: " + name);
        });
      },
      error: function(xhr, status, error) {
        alert("An AJAX error occurred: " + status + "\nError: " + error);
      }
    });
  }

</script>
</body>
</html>
