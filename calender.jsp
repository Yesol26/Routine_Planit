<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
    <%@page import="java.text.SimpleDateFormat" %>
        <%@page import="java.util.Calendar" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
                <title>달력</title>
                <style>
                    /* 달력 디자인 */
                    .calendar {
                        border-collapse: collapse;
                        width: 60%;
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

                    .calendar td:hover {
                        background-color: #f2f2f2;
                        cursor: pointer;
                    }

                    .today {
                        background-color: #4CAF50;
                        color: white;
                    }

                    /* 일정 추가 폼 디자인 */
                    .form-popup {
                        display: none;
                        position: fixed;
                        bottom: 0;
                        right: 15px;
                        border: 1px solid #ccc;
                        z-index: 9;
                        background-color: #fefefe;
                        padding: 20px;
                        max-width: 300px;
                    }

                    .form-container {
                        max-width: 300px;
                        padding: 10px;
                        background-color: white;
                    }

                    .form-container input[type=text],
                    .form-container input[type=time],
                    .form-container textarea {
                        width: 100%;
                        padding: 10px;
                        margin: 5px 0 15px 0;
                        border: none;
                        background: #f1f1f1;
                    }

                    .form-container input[type=submit] {
                        background-color: #4CAF50;
                        color: white;
                        padding: 12px 20px;
                        border: none;
                        cursor: pointer;
                        width: 100%;
                        margin-bottom: 10px;
                    }

                    .form-container input[type=submit]:hover {
                        background-color: #45a049;
                    }

                    .form-container .btn-cancel {
                        background-color: #f44336;
                    }

                    .form-container .btn-cancel:hover {
                        background-color: #da190b;
                    }
                </style>
            </head>

            <body>
                <h1>달력</h1>
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
                <!-- 일정 추가 폼 -->
                <div class="form-popup" id="myForm">
                    <form class="form-container">
                        <h2>일정 추가</h2>
                        <label for="title"><b>제목</b></label>
                        <input type="text" placeholder="제목을 입력하세요" name="title" required>

                        <label for="time"><b>시간</b></label>
                        <input type="time" placeholder="시간을 입력하세요" name="time" required>

                        <label for="location"><b>장소</b></label>
                        <input type="text" placeholder="장소를 입력하세요" name="location" required>

                        <label for="memo"><b>메모</b></label>
                        <textarea placeholder="메모를 입력하세요" name="memo"></textarea>

                        <button type="submit" class="btn">저장</button>
                        <button type="button" class="btn btn-cancel" onclick="closeForm()">취소</button>
                    </form>
                </div>
                <script type="text/javascript" language="javascript">
                    const date = new Date(); // 현재 날짜와 시간을 가져옵니다
                    const year = date.getFullYear(); // 현재 연도를 가져옵니다
                    const month = date.getMonth(); // 현재 월을 가져옵니다 (0부터 시작하므로 +1을 해줘야합니다)
                    const day = date.getDate(); // 현재 일자를 가져옵니다

                    function showCalendar() {
                    const firstDay = new Date(year, month, 1); // 해당 달의 첫번째 날짜를 가져옵니다
                    const lastDay = new Date(year, month + 1, 0); // 해당 달의 마지막 날짜를 가져옵니다

                    const days = document.querySelectorAll('.calendar tbody td'); // 날짜가 출력될 td 요소들을 가져옵니다

                    let dayCount = 1; // 날짜를 채워나갈 변수입니다

                    // 이전 달 날짜를 빈칸으로 채웁니다
                    const prevLastDay = new Date(year, month, 0); // 이전 달의 마지막 날짜를 가져옵니다
                    for (let i = firstDay.getDay() - 1; i >= 0; i--) {
                        days[i].textContent = '';
                    }

                    // 해당 월의 날짜를 채웁니다
                    for (let i = firstDay.getDay(); i < lastDay.getDate() + firstDay.getDay(); i++) {
                        if (dayCount > lastDay.getDate()) break; // 해당 달의 날짜가 아니면 반복을 종료합니다.
                        days[i].textContent = dayCount;
                        dayCount++;
                    }

                    // 요일 위에 달도 표시해줍니다
                    const title = document.querySelector('.calendar thead th');
                    title.textContent = year + '년 ' + (month + 1) + '월';

                    // 오늘 날짜에 해당하는 요소를 찾아 표시해줍니다.
                    const today = new Date();
                    if (today.getFullYear() === year && today.getMonth() === month) {
                        const todayIndex = firstDay.getDay() + today.getDate() - 1;
                        days[todayIndex].classList.add('today');
                    }
                }
                showCalendar()
                    function showPrevCalendar() {
                        month--; // 이전 달로 변경
                        if (month < 0) { // 1월에서 이전 달을 누르면 작년 12월로 변경
                            year--;
                            month = 11;
                        }
                        showCalendar();
                    }

                    function showNextCalendar() {
                        month++; // 다음 달로 변경
                        if (month > 11) { // 12월에서 다음 달을 누르면 내년 1월로 변경
                            year++;
                            month = 0;
                        }
                        showCalendar();
                    }



                    // 일정 추가 폼 열기/닫기
                    function openForm() {
                        document.getElementById("myForm").style.display = "block";
                    }
                    function closeForm() {
                        // 폼을 닫는 함수
                        document.getElementById("myForm").style.display = "none";
                    }

                    // 일정 추가
                    // form-container 클래스를 가진 요소를 찾아 form 변수에 할당
                    var form = document.querySelector('.form-container');

                    // form 요소에 submit 이벤트 리스너 등록
                    form.addEventListener('submit', function (e) {
                        // 기본 동작 취소
                        e.preventDefault();

                        // 입력된 값들을 변수에 할당
                        var title = this.querySelector('input[name="title"]').value;
                        var time = this.querySelector('input[name="time"]').value;
                        var location = this.querySelector('input[name="location"]').value;
                        var memo = this.querySelector('textarea[name="memo"]').value;

                        // form-popup 클래스를 가진 요소의 data-date 속성값을 변수에 할당
                        var date = document.querySelector('.form-popup').dataset.date;

                        // data-date 속성값이 위에서 할당한 date 변수와 일치하는 td 요소를 찾아 cell 변수에 할당
                        var cell = document.querySelector('td[data-date="' + date + '"]');

                        // cell 요소의 innerHTML에 새로운 이벤트를 추가
                        cell.innerHTML += '<div class="event"><h3>' + title + '</h3><p>' + time + '</p><p>' + location + '</p><p>' + memo + '</p></div>';

                        // closeForm 함수 호출
                        closeForm();
                    });

                    // 날짜 클릭 이벤트를 변경하여 해당 셀이 비어있을 경우에만 폼을 열도록 함
                    var cells = document.querySelectorAll('td');
                    for (var i = 0; i < cells.length; i++) {
                        cells[i].addEventListener('click', function () {
                            var date = this.dataset.date;
                            if (this.innerText !== "<" && this.innerText !== ">") { // 수정된 부분
                                document.querySelector('.form-popup').dataset.date = date;
                                openForm();
                            }
                            else if (this.innerText == "<") {
                                showPrevCalendar()
                            }
                            else if (this.innerText == ">") {
                                showNextCalendar()
                            }
                        });
                    }




                </script>
            </body>

            </html>