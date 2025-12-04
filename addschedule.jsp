<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<%
    // 폼 데이터 가져오기
    String date = request.getParameter("date");
    String title = request.getParameter("title");
    String start_time = request.getParameter("startTime");
    String end_time = request.getParameter("endTime");
    String location = request.getParameter("location");
    String memo = request.getParameter("memo");
    String user_id = (String) session.getAttribute("userid"); // 예시로 고정된 사용자 ID


    

    // 데이터베이스 연결 정보 설정
    String driverName = "org.gjt.mm.mysql.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/mysql19";
    String dbUsername = "root";
    String dbPassword = "kbc0924";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName(driverName);

        // 데이터베이스 연결
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // SQL 쿼리 작성
        String sql = "INSERT INTO events (user_id, date, title, start_time, end_time, location, memo) VALUES (?, ?, ?, ?, ?, ?, ?)";

        // PreparedStatement 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user_id);
        pstmt.setString(2, date);
        pstmt.setString(3, title);
        pstmt.setString(4, start_time);
        pstmt.setString(5, end_time);
        pstmt.setString(6, location);
        pstmt.setString(7, memo);

        // 쿼리 실행
        int rowCount = pstmt.executeUpdate();

        if (rowCount > 0) {
            // 저장 성공
            out.println("데이터 저장에 성공하였습니다.");
        } else {
            // 저장 실패
            out.println("데이터 저장에 실패하였습니다.");
        }
    } catch (Exception e) {
        out.println("데이터 저장 중 오류가 발생하였습니다.");
        e.printStackTrace();
    } finally {
        // 자원 해제
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>