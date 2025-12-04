<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
    <%@page import="java.text.SimpleDateFormat" %>
        <%@page import="java.util.Calendar" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<% request.setCharacterEncoding("euc-kr"); %>


            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
                <title>일정관리 프로그램</title>
                <style>

                    @font-face {
                        font-family: 'NanumSquareNeo-Variable';
                        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
                        font-weight: normal;
                        font-style: normal;
                    }
                    /* 달력 디자인 */
                    .container {
                        display: flex;
                        /* flexbox 레이아웃을 사용하기 위한 속성(일정한 비율) */
                    }
                    /*일정추가 버튼 레이아웃*/
                    .container1 {
                        display: flex;
                        /* flexbox 레이아웃을 사용하기 위한 속성 */
                        height: 80px;
                        width: 80%;
                    }
                    /*일정목록 레이아웃 */
                    .container2{
                        background-color: #f2f2f2;
                        text-align: center;
                        padding: 10px 10px;
                        width: 80%;
                        height: 60px;
                        font-size: 20px;
                    }

                    /*일정추가, 추가, 삭제*/
                    .button { 
                        padding: 10px;
                        width: 40%;
                        height: 100%
                    }

                    .event-container {
                        width: 80%;
                        height: 680px;
                        max-height: 680px;
                        overflow-y: auto;
                        padding: 10px;
                        border: 1px solid #ddd;
                        background-color: #f2f2f2;
                    }

                    .event-button {
                        width: 30%;
                    }

                    .calendar {
                        border-collapse: collapse;
                        width: 70%;
                        font-size: 20px;
                        text-align: center;
                    }

                    .calendar th {
                        background-color: #f2f2f2;
                        padding: 10px;
                    }

                    .calendar td {
                        padding: 10px;
                        border: 1px solid #ddd;
                        height: 100px;
                        position: relative;
                        text-align: left;
                        vertical-align: top;
                    }
                    /* 효과 */
                    .calendar td:hover {
                        background-color: #f2f2f2;
                        cursor: pointer;
                    }
                    /*오늘 날짜 배경 색*/
                    .today {
                        background-color: #4CAF50;
                        color: white;
                    }


                    /* 일정 추가 폼 디자인 */
                    .form-popup {
                        display: none;
                        position: fixed;
                        bottom: 60px;
                        left: 30px;
                        border: 1px solid #ccc;
                        z-index: 9;
                        background-color: #fefefe;
                        padding: 30px;
                        max-width: 400px;
                        /* 변경된 값 */
                    }

                    .form-container {
                        max-width: 400px;
                        /* 변경된 값 */
                        padding: 20px;
                        /* 변경된 값 */
                        background-color: white;
                    }

                    .form-container input[type="text"],
                    .form-container input[type="date"],
                    .form-container input[type="time"],
                    .form-container textarea {
                        width: 100%;
                        padding: 12px;
                        /* 변경된 값 */
                        margin: 5px 0 15px 0;
                        border: none;
                        background: #f1f1f1;
                    }

                    .form-container input[type="submit"] {
                        background-color: #4caf50;
                        color: white;
                        padding: 14px 20px;
                        /* 변경된 값 */
                        border: none;
                        cursor: pointer;
                        width: 100%;
                        margin-bottom: 10px;
                    }
                    

                    .form-container input[type="submit"]:hover {
                        background-color: #45a049;
                    }

                    .form-container .btn-cancel {
                        background-color: #f44336;
                    }

                    .form-container .btn-cancel:hover {
                        background-color: #da190b;
                    }

                    .event {
                        margin-bottom: 10px;
                        padding: 5px;
                        border: 1px solid #ccc;
                        background-color: #fff;
                    }
                    .event h4{
                        margin: 5px 0;
                        
                    }
                    .event h3,
                    .event p {
                        margin: 5px 0;
                    }
                    .event1 {
                        background-color: #f2f2f2;
                        border: 1px solid #ccc;
                        padding: 10px;
                        margin-bottom: 10px;
                        }

                        .event1 h3 {
                        margin: 0;
                        font-size: 18px;
                        }

                        .event1 p {
                        margin: 0;
                        font-size: 14px;
                        color: #888;
                        }

                    .btn {
                        padding: 14px 20px;
                    }
                    body{
                        font-family: 'NanumSquareNeo-Variable';
                    }
                    body h1{
                        text-align: center;
                    }
                </style>
            </head>

            <body>
                <h1>일정관리 프로그램</h1>
                <div class="container">
                    <table class="calendar">
                        <thead>
                            <tr>
                                <th colspan="5"></th>
                                <td style="background-color: #f2f2f2; padding: 10px; height: 20px; text-align: center;"><</td>
                                <td style="background-color: #f2f2f2; padding: 10px; height: 20px; text-align: center;">></td>
                            </tr>
                            <tr>
                                <th>일</th>
                                <th>월</th>
                                <th>화</th>
                                <th>수</th>
                                <th>목</th>
                                <th>금</th>
                                <th>토</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 달력 날짜 표시 -->
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="event-button">
                        <div class="container2">
                            <h4>일정목록</h4>
                        </div>
                        <div id = "event-container" class="event-container">
                            
                        </div>
                        <div class="container1">
                            <div class="button">
                                <button id="addEventButton" class="btn">일정 추가</button>
                            </div>
                        </div>
                    </div>


            </body>
            <!-- 일정 추가 폼 -->
            <div class="form-popup" id="myForm">
                <form class="form-container">
                    <h2>일정 추가</h2>
                    <label for="date"><b>날짜</b></label>
                    <br>
                    <input type="date" min="2022-01-01" max="2100-12-31" name=date required>
                    <br>

                    <label for="title"><b>제목</b></label>
                    <input type="text" placeholder="제목을 입력하세요" name="title" required>

                    <label for="startTime"><b>시작 시간</b></label>
                    <input type="time" name="startTime" required>

                    <label for="endTime"><b>끝나는 시간</b></label>
                    <input type="time" name="endTime" required>

                    <label for="location"><b>장소</b></label>
                    <input type="text" placeholder="장소를 입력하세요" name="location" required>

                    <label for="memo"><b>메모</b></label>
                    <textarea placeholder="메모를 입력하세요" name="memo"></textarea>

                    <button type="submit" class="btn">저장</button>
                    <button type="button" class="btn btn-cancel" onclick="closeForm()">취소</button>
                </form>
            </div>
            <%
                //String userid = request.getParameter("user_id");
                String userid = (String) session.getAttribute("userid");
                session.setAttribute("userid", userid);


            %>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script type="text/javascript" language="javascript">
                var userid = '<%= userid%>';
                const date = new Date();
                let year = date.getFullYear();
                let month = date.getMonth();
                const day = date.getDate();
                var selectedDate = null;

                function showCalendar() {
                    const firstDay = new Date(year, month, 1);
                    const lastDay = new Date(year, month + 1, 0);

                    const days = document.querySelectorAll('.calendar tbody td');

                    days.forEach((day) => {
                        day.textContent = '';
                    });

                    let dayCount = 1;

                    for (let i = firstDay.getDay(); i < lastDay.getDate() + firstDay.getDay(); i++) {
                        if (dayCount > lastDay.getDate()) break;
                        days[i].textContent = dayCount;
                        dayCount++;
                    }

                    const title = document.querySelector('.calendar thead th');
                    title.textContent = year + '년 ' + (month + 1) + '월';

                    const todayElement = document.querySelector('.calendar tbody td.today');
                    if (todayElement) {
                        todayElement.classList.remove('today');
                    }

                    const today = new Date();
                    if (today.getFullYear() === year && today.getMonth() === month) {
                        const todayIndex = firstDay.getDay() + today.getDate() - 1;
                        days[todayIndex].classList.add('today');
                    }
                }

                showCalendar();

                function showPrevCalendar() {
                    month--;
                    if (month < 0) {
                        year--;
                        month = 11;
                    }
                    showCalendar();
                }

                function showNextCalendar() {
                    month++;
                    if (month > 11) {
                        year++;
                        month = 0;
                    }
                    showCalendar();
                }

                function openForm() {
                    updateSelectedDate();
                    document.getElementById("myForm").style.display = "block";
                }

                function closeForm() {
                    document.getElementById("myForm").style.display = "none";
                }



                var form = document.querySelector('.form-container');
                $(document).ready(function() {
                    $('form').submit(function(e) {
                        e.preventDefault(); // 폼의 기본 동작인 submit 동작을 막음
                        var formData = $('form').serialize(); // 폼 데이터 직렬화
                        console.log(formData.date);
                        let para = "addschedule.jsp";
                        $.ajax({
                            type: 'POST',
                            url: para, // 데이터를 처리할 JSP 페이지 경로
                            data: formData,
                            success: function(response) {
                                // 저장이 성공적으로 완료된 후의 동작
                                alert('저장되었습니다.');
                                // 추가로 필요한 작업을 수행하거나 페이지를 다시 로드할 수 있습니다.
                                closeForm();
                            },
                            error: function(xhr, status, error) {
                                // 저장 중 오류가 발생한 경우의 처리
                                alert('저장에 실패하였습니다. 다시 시도해주세요.');
                                console.log(xhr.responseText);
                            }
                        });
                    });
                });
            

                function updateSelectedDate() {
                    var selectedDateElement = document.querySelector('.selected-date');
                    if (selectedDateElement) {
                        selectedDateElement.textContent = selectedDate;
                    }
                }

                // 선택된 날짜 표시 함수
                function showSelectedDate(date) {
                    var selectedDateElement = document.querySelector('.selected-date');
                    selectedDateElement.textContent = date;
                }

            
                var cal = document.querySelectorAll('td');
                for (var i = 0; i < cal.length; i++) {
                    cal[i].addEventListener('click', function () {
                        if (this.innerText === "<") {
                            showPrevCalendar();
                        } else if (this.innerText === ">") {
                            showNextCalendar();
                        } 
                        else if (this.innerText !== "") {
                            var selDate = year + "-" + (month + 1) + "-" + this.innerHTML;
                            console.log(selDate,userid);
                            var xhr = new XMLHttpRequest();
                            
                            xhr.open("GET", "loaddata.jsp?selDate=" + selDate, true);
                            xhr.onreadystatechange = function () {
                                var responseData;
                                if (xhr.readyState === XMLHttpRequest.DONE) {
                                    if (xhr.status === 200) {
                                        console.log('가져온 데이터:', xhr.responseText);
                                        responseData = xhr.responseText; // 서버로부터의 응답
                                        // 가져온 데이터를 필요에 따라 처리하기
                                        console.log('가져온 데이터:', responseData);

                                        // 일정 데이터를 추가할 부모 요소를 선택합니다.
                                        var eventContainer = document.getElementById('event-container');

                                        // 기존의 일정 요소를 제거합니다.
                                        while (eventContainer.firstChild) {
                                            eventContainer.removeChild(eventContainer.firstChild);
                                        }

                                        // responseData를 반복하여 각각의 일정 요소를 생성하고 추가
                                        var events = responseData.split(';'); // ';'을 기준으로 일정 데이터를 구분

                                        for (var j = 0; j < events.length; j++) {
                                            var eventData = events[j].split(','); // ','을 기준으로 일정의 각 항목을 분리

                                            // 데이터의 유효성을 확인하여 HTML 생성
                                            if (eventData.length >= 5) {
                                                var newEvent = document.createElement('div');
                                                newEvent.className = 'event';

                                                // 일정 데이터를 포함하는 HTML 생성
                                                var html = '<h3>' + eventData[0] + '</h3>';
                                                html += '<p>' + eventData[1] + ' - ' + eventData[2] + '</p>';
                                                html += '<p>' + eventData[3] + '</p>';
                                                html += '<p>' + eventData[4] + '</p>';

                                                newEvent.innerHTML = html;
                                                eventContainer.appendChild(newEvent);
                                            }
                                        }
                                    } else {
                                        console.error("오류:", xhr.status);
                                    }
                                }
                            };
                            xhr.send();
                        }
                    });
                }

                var addEventButton = document.getElementById('addEventButton');
                addEventButton.addEventListener('click', function () {
                    openForm();
                });
            </script>
            </body>

            </html>