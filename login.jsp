<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>

<!DOCTYPE html>
<html>

<head>
    <title>로그인</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>

        @font-face {
            font-family: 'NanumSquareNeo-Variable';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        .login-container {
            width: 330px;
            margin: 0 auto;
            margin-top: 180px;
            background: linear-gradient(35deg, #fffafa , #e9e9e9 );
            border-radius: 10px;
            padding: 20px;
            box-shadow: 6px 6px 5px gray;
        }
        .login-pro {
            margin-top: 10px;
            text-align : center;
            
        }
        .login-form {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            color: #161616;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            background-color: #F8F8FF;
            border: none;
            color: #222;
            border-radius: 20px;
            padding: 10px;
            font-size: 16px;
            width: 100%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group input[type="submit"] {
            text-decoration: none; 
            border: none;
            background-color: #bce2a1;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        

        body {
            background-color: #bce2a1;
            font-family: 'NanumSquareNeo-Variable';
        }

        .btn{
            border:none;
            border-radius:10px;
            background-color: #bce2a1;
            color: rgb(131, 131, 131);
          
        }
        a {
            text-decoration: none;
            color:rgb(131, 131, 131); }

    </style>
</head>

<body>
    <div class="container">
        <div class="login-container">
            <div class = "login-pro"><img src = "pro.png" width=60px> </div>
            <h2><center>로그인</center></h2>
            <form class="login-form" action="logincheck.jsp" method="POST">
                <hr> <div class="form-group">
                    <label for="username">아이디 :</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호:</label>
                    <input type="password" class="form-control" id="password" name="password" required><hr>
                </div>
                <center>
                    <button class="btn"  type="submit" >로그인</button></center><br>
                    아직 회원이 아니신가요? &nbsp&nbsp&nbsp&nbsp&nbsp
                    <div  class="btn"><a href="join.jsp">회원가입</a></div>
            </form>
        </div>
    </div>
</body>

</html>