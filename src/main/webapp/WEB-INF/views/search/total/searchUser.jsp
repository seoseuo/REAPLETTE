<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 <html lang="ko">
   <head>
     <meta charset="UTF-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <title>리플렛 - 사용자 검색</title>
     <!-- CSS 경로 수정 -->
     <link rel="stylesheet" href="/resources/css/search/style.css" />
     <link
       href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
       rel="stylesheet"
       integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
       crossorigin="anonymous"
     />
      <link rel="stylesheet" href="/resources/css/headerstyle.css">

     <!-- JavaScript 경로 수정 -->
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
     <script src="/resources/js/search/user.js"></script>
   </head>
   <body>
   <header>
       <jsp:include page="/WEB-INF/views/includes/header.jsp" />
   </header>

   <div id="wrapper" class="py-3">
       <div class="tab_menu">
           <ul class="d-flex justify-content-center gap-4 fw-bold">
               <li><a class="tm_a py-2" href="/search/total">Overview</a></li>
               <li><a class="tm_a py-2" href="/search/total/book">Book</a></li>
               <li><a class="tm_a py-2" href="/search/total/author">Author</a></li>
               <li><a class="tm_a py-2" href="/search/total/post">Post</a></li>
               <li class="active"><a class="tm_a py-2" href="#">User</a></li>
           </ul>
       </div>
       <!-- /tab_menu -->
   </div>

<ul class="py-5 px-3">
    <!-- 사용자 목록 출력 -->
    <c:forEach var="user" items="${userList}">
        <!-- 현재 로그인한 사용자 제외 -->
        <c:if test="${user.id == sessionScope.user.id}">
            <c:set var="isFollowing" value="false" />
            <!-- 팔로우 리스트를 통해 현재 사용자가 해당 사용자(user)를 팔로우하고 있는지 확인 -->
            <c:forEach var="follow" items="${followList}">
                            follow.followingId : ${follow.followingId}
                            sessionScope.user.id : ${sessionScope.user.id}
                            follow.followerId : ${follow.followerId}
                            user.id : ${user.id}
                            <c:if test="${follow.followingId == sessionScope.user.id && follow.followerId == user.id}">
                                <c:set var="isFollowing" value="true" />
                                <break/>
                            </c:if>
                        </c:forEach>
            <li class="row align-items-center mb-5">
                <!-- 프로필 사진 -->
                <div class="col-2 ul_icon">
                    <img src="${user.profileImagePath}" alt="${user.username}" class="img-fluid rounded-circle" />
                </div>
                <!-- 활동자명 -->
                <p class="col ul_title mb-0 fs-5">${user.username}</p>
                <!-- 팔로우/팔로잉 버튼 -->
                                <button id="${isFollowing ? 'unfollow' : 'follow'}"
                                        class="rounded-5 py-2 fw-bold userFollow"
                                        data-user-id="${sessionScope.user.id}"
                                        data-current-user-id="${user.id}"
                                        style="${isFollowing ? 'background-color: #007bff; color: white; border: none;' : 'background-color: white; color: #007bff; border: 2px solid #007bff;'}"
                                        onclick="${isFollowing ? 'unfollow(event)' : 'follow(event)'}">
                                    ${isFollowing ? '팔로잉' : '팔로우'}
                                </button>

            </li>
        </c:if>
    </c:forEach>
</ul>


<button id="${isFollowing ? 'unfollow' : 'follow'}"
                                        class="rounded-5 py-2 fw-bold userFollow"
                                        data-user-id="${sessionScope.user.id}"
                                        data-current-user-id="${user.id}"
                                        style="${isFollowing ? 'background-color: #007bff; color: white; border: none;' : 'background-color: white; color: #007bff; border: 2px solid #007bff;'}"
                                        onclick="${isFollowing ? 'unfollow(event)' : 'follow(event)'}">
                                    팔로우
                                </button>

</body>
</html>
