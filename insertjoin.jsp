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
	String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql19";
    
    try {
		Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "kbc0924");

        String check = "SELECT * FROM user WHERE username = ?";
        pstmt = con.prepareStatement(check);
        pstmt.setString(1, username);
        ResultSet checkResult = pstmt.executeQuery();
        if (checkResult.next()) {
            out.println("중복된 아이디입니다.");
        } else {
            String insertQuery = "INSERT INTO user (username, password, name, phone, email) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(insertQuery);
            //삽입할 학생 레코드 데이터 입력
            pstmt.setString(1, username);
            pstmt.setString(2, request.getParameter("password"));
            pstmt.setString(3, request.getParameter("name"));
            pstmt.setString(4, request.getParameter("phone"));
            pstmt.setString(5, request.getParameter("email"));
            int rowCount = pstmt.executeUpdate(); 
            if (rowCount == 1) {
                out.println("<hr>[" + request.getParameter("name") + "] 님 회원가입이 완료되었습니다.<hr>");
                response.sendRedirect("login.jsp");
            } else {
                out.println("회원가입에 실패하였습니다. 다시 시도해주세요.");
                response.sendRedirect("join.jsp");
            }
            
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