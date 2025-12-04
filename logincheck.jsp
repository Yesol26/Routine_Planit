<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<h2></h2>
<hr>
<center>
<h2></h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
	Statement stmt = null;
    String username = request.getParameter("username");
    String password = request.getParameter("password");
	String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql19";

    
    try {
		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");
        String check = "SELECT userid, password FROM user WHERE username = ?";
        pstmt = con.prepareStatement(check);
        pstmt.setString(1, username);
        ResultSet checkResult = pstmt.executeQuery();
        if (checkResult.next()) {
            String dbPassword = checkResult.getString("password");
            if (password.equals(dbPassword)) {
                String userid = checkResult.getString("userid");
                session.setAttribute("userid", userid);
                response.sendRedirect("cal.jsp");
                //response.sendRedirect("cal.jsp?user_id=" + checkResult);
                
            } else {
                out.println("<script>alert('비밀번호가 틀렸습니다.');</script>");
            }
        } else {
            out.println("<script>alert('없는 아이디입니다.');</script>");
        }
    } catch(Exception e) {
    	out.println("MySql 데이터베이스 univdb의 student 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    } finally {
        if(pstmt != null) pstmt.close();
        if(con != null) con.close();
    }
%>

<p><hr>

</body>
</html>