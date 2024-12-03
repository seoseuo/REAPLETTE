<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <link rel="stylesheet" href="../../../../../resources/css/myPage/myGolasListstyle.css">


      <style>
        a,
        button,
        input,
        select,
        h1,
        h2,
        h3,
        h4,
        h5,
        * {
          box-sizing: border-box;
          margin: 0;
          padding: 0;
          border: none;
          text-decoration: none;
          background: none;

          -webkit-font-smoothing: antialiased;
        }

        menu,
        ol,
        ul {
          list-style-type: none;
          margin: 0;
          padding: 0;
        }
      </style>

      <title>리플렛 - 내 목표</title>



    </head>

    <body>



      <div class="div">
        <!-- nav -->
        <jsp:include page="/WEB-INF/views/includes/mypagenav/myPageNav.jsp" />
        <!-- nav -->

        <div class="page-content">
          <div class="table">
            <div class="header">
              <div class="auto-layout-vertical">
                <div class="div4">
                  <span>
                    <span class="div-4-span">
                      캘린더
                      <br />
                    </span>
                    <span class="div-4-span2">
                      목표를 설정하면 캘린더에 일정이 등록됩니다 !
                    </span>
                  </span>
                </div>
              </div>
            </div>

            <!-- 달력 -->
            <div class="table2">
              <img class="image-59" src="../../../resources/images/myPage/image-590.png" />
            </div>
          </div>

          <div class="table3">
            <div class="header2">
              <div class="auto-layout-vertical2">
                <div class="div5">
                  <span>
                    <span class="div-5-span">
                      목표 도서
                      <br />
                    </span>
                    <span class="div-5-span2">
                      목표를 설정하고 독서 습관을 길러보아요 !
                    </span>
                  </span>
                </div>
              </div>

              <a href="/myPage/myGoals/AddBooks">
                <div class="type-primary-size-large-status-enable">
                  <div class="button">도서 추가</div>
                </div>
              </a>

            </div>

            <div class="auto-layout-horizontal">

              <div class="frame-2">

                <!-- 한 행 시작 -->
                <div class="auto-layout-horizontal4">


                  <c:forEach var="goal" items="${goalList}">
                    <!-- 카드뷰 요소 시작 -->
                    <a href="/myPage/myGoals/bookInfo?goal=${goal}">
                      <div class="book-card-view">
                        <img class="style-square" src="${goal.bookImageUrl}" />
                        <div class="auto-layout-vertical3">
                          <div class="div6">
                            <span>
                              <span class="div-6-span">
                                ${goal.bookTitle} <!-- 도서 명 -->
                                <br />
                              </span>
                              <span class="div-6-span2">${goal.author}</span> <!-- 저자 명 -->
                            </span>
                          </div>
                          <div class="div7" data-pages-read="${goal.pagesRead}" data-total-page="${goal.totalPage}">
                          </div>

                        </div>
                      </div>
                      <br><br>
                    </a>
                    <!-- 카드뷰 요소 끝 -->
                  </c:forEach>




                </div>






              </div>

            </div>

          </div>
        </div>
      </div>

      <script src="../../../../resources/js/myPage/myGoalsList.js" defer></script>
    </body>

    </html>