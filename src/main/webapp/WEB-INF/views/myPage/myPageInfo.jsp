<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../../resources/css/myPage/infostyle.css">
  <link rel="stylesheet" href="../../../resources/css/myPage/exceptionstyle.css">
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
  <title>리플렛 - 내 정보</title>
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
                  내 정보
                  <br />
                </span>
                <span class="div-4-span2">회원님의 정보를 수정하세요.</span>
              </span>
            </div>
          </div>
        </div>

        <form id="myInfo" action="/myPage/editInfo" method="POST" enctype="multipart/form-data">
          <div class="table2">
            <!-- 이미지 업로드 -->
            <label for="profileimage" style="cursor: pointer;">
              <div class="user-thumb2">
                <img class="icon-jam-icons-outline-logos-user2"
                     src="${user.profileImagePath}" /> <!-- 수정된 부분 -->
              </div>
            </label>
            <br>
            <a href="">기본 프로필</a>

            <!-- 실제 파일 업로드 입력 요소 (숨김 처리) -->
            <input type="file" id="profileimage" name="profileImagePath" accept="image/*" style="display: none;">

            <span class="exception-field" id="profile-exception-field"></span>
            <div class="table3">
              <div class="headline">
                <div class="section-text">
                  <div class="top">
                    <div class="secondary-headline">
                      기본 정보
                      <br /><br /><br /><br /><br/>
                      비밀번호
                    </div>
                  </div>
                </div>
              </div>

              <div class="section-text2">
                <div class="top">
                  <div class="secondary-headline2">
                    이메일
                    <br />
                    <br />
                    이름
                    <br />
                    <span class="exception-field" id="name-exception-field"></span>
                    <br />

                    비밀번호 재설정
                    <br />
                    <span class="exception-field" id="pw-exception-field"></span>
                    <br />
                    비밀번호 확인
                    <br/>
                    <span class="exception-field" id="pw-check-exception-field"></span>
                  </div>
                </div>
              </div>

              <div class="table4">
                <div>
                  ${user.id}
                </div>
                <div class="field">
                  <input class="text2" type="text" id="name" name="name" value="${user.username}"> <!-- 수정된 부분 -->
                </div>
                <div class="field2">
                  <input class="text2" type="password" id="pw" name="pw">
                </div>
                <div class="field2">
                  <input class="text2" type="password" id="pw-check" name="pw-check">
                </div>

                <div class="type-primary-size-medium-status-enable">
                  <input type="submit" class="button" value="수정완료">
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="icon-heroicons-outline-user"></div>
  </div>

  <script src="../../../resources/js/myPage/exceptionstyle.js"></script>
</body>
</html>
