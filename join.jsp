<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<html>

<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>

        @font-face {
                    font-family: 'NanumSquareNeo-Variable';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
                    font-weight: normal;
                    font-style: normal;
                }


        .signup-container {
            width: 300px;
            margin: 0 auto;
            margin-top: 100px;
            background: linear-gradient(35deg, #fffafa , #e9e9e9 );
            border-radius: 15px;
            padding: 20px;
            box-shadow: 6px 6px 5px gray;
        }

        .signup-form {
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
        .form-group input[type="tel"],
        .form-group input[type="password"],
        .form-group input[type="email"] {
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
            background-color: #222;
            border: none;
            color: #F8F8FF;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 16px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'NanumSquareNeo-Variable';
            background-color:  #bce2a1;
        }
        .btn{
            border:none;
            border-radius:10px;
            background-color: #bce2a1;
            color: rgb(131, 131, 131);
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="signup-container">
            <center><h2>회원가입</h2></center> <hr>
            <form class="signup-form" action="insertjoin.jsp" method="POST">
                <div class="form-group">
                    <label for="username">아이디:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="name">이름:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="phone">전화번호:</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="email">이메일:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <hr><center>
                <button type="submit" class="btn">가입하기</button></center>
            </form>
        </div>
    </div>
</body>


</html>