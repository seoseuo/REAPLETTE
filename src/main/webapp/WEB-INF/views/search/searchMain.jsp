<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>리플렛 - 통합검색</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/search/style.css' />" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/resources/css/headerstyle.css" />

    <script
      src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <header>
      <jsp:include page="/WEB-INF/views/includes/header.jsp" />
    </header>

    <div id="wrapper" class="py-3">
      <div class="tab_menu">
        <ul class="d-flex justify-content-center gap-4 fw-bold">
          <li class="active"><a class="tm_a py-2" href="#">Overview</a></li>
          <li><a class="tm_a py-2" href="/search/total/book">Book</a></li>
          <li><a class="tm_a py-2" href="/search/total/author">Author</a></li>
          <li><a class="tm_a py-2" href="/search/total/post">Post</a></li>
          <li><a class="tm_a py-2" href="/search/total/user">User</a></li>
        </ul>
      </div>
      <!-- /tab_menu -->

      <div class="container py-5 px-0 overflow-hidden">
        <section class="overview totalSearch py-5">
          <!-- Books -->
          <div class="ts-book border border-dark-subtle mb-4 px-3 py-2 rounded-4">
            <h4 class="fw-bold"><a href="<c:url value='/search/total/book' />" style="color: var(--color-black);">Book</a></h4>
            <ul>
              <c:if test="${empty bookList}">
                  <li>
                    <p>검색 결과가 없습니다.</p>
                  </li>
              </c:if>
              <c:forEach var="book" items="${bookList}">
                <li>
                  <p>제목: ${book.title}</p>
                  <p>저자: ${book.author}</p>
                </li>
              </c:forEach>
            </ul>
          </div>

          <!-- Authors -->
          <div class="ts-author border border-dark-subtle mb-4 px-3 py-2 rounded-4">
            <h4 class="fw-bold"><a href="<c:url value='/search/total/author' />" style="color: var(--color-black);">Author</a></h4>
            <ul>
             <c:if test="${empty authorList}">
                <li>
                    <p>검색 결과가 없습니다.</p>
                </li>
              </c:if>
              <c:forEach var="author" items="${authorList}">
                <li>
                  <p>이름: ${author.name}</p>
                  <p>대표작: ${author.mainWork}</p>
                </li>
              </c:forEach>
            </ul>
          </div>

          <!-- Posts -->
          <div class="ts-post border border-dark-subtle mb-4 px-3 py-2 rounded-4">
            <h4 class="fw-bold"><a href="<c:url value='/search/total/post' />" style="color: var(--color-black);">Post</a></h4>
            <ul>
            <c:if test="${empty postList}">
                <li>
                    <p>검색 결과가 없습니다.</p>
                </li>
            </c:if>
            <c:forEach var="post" items="${postList}">
                <li>
                  <p>제목: ${post.title}</p>
                  <p>내용: ${post.content}</p>
                </li>
            </c:forEach>
            </ul>
          </div>

          <!-- Users -->
          <div class="ts-users border border-dark-subtle mb-4 px-3 py-2 rounded-4">
            <h4 class="fw-bold"><a href="<c:url value='/search/total/user' />" style="color: var(--color-black);">User</a></h4>
            <ul>
            <c:if test="${empty userList}">
                <li>
                    <p>검색 결과가 없습니다.</p>
                </li>
            </c:if>
            <c:forEach var="user" items="${userList}">
                <li>
                  <p>이름: ${user.username}</p>
                  <p>가입일: ${user.joinDate}</p>
                </li>
            </c:forEach>
            </ul>
          </div>

          <!-- pagination -->
          <div class="mt-5">
            <ul class="pagination d-flex justify-content-center gap-4 fw-bold">
                <!-- Previous 버튼 -->
                <li class="${currentPage == 1 ? 'disabled' : ''}">
                    <a class="px-2 py-1" href="?page=${currentPage - 1}" ${currentPage == 1 ? 'onclick="return false;"' : ''}>Previous</a>
                </li>

                <!-- 동적 페이지 번호 버튼 -->
                <c:forEach begin="1" end="${totalPages}" var="page">
                    <li class="${currentPage == page ? 'active' : ''}">
                        <a class="px-2 py-1" href="?page=${page}">${page}</a>
                    </li>
                </c:forEach>

                <!-- Next 버튼 -->
                <li class="${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="px-2 py-1" href="?page=${currentPage + 1}" ${currentPage == totalPages ? 'onclick="return false;"' : ''}>Next</a>
                </li>
            </ul>
          </div>
        </section>
        <!-- /overview -->
      </div>
      <!-- /container -->
    </div>
    <!-- /wrapper -->
  </body>
</html>