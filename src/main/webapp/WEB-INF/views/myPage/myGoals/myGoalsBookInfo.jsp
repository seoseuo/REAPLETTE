<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="../../../../../resources/css/myPage/myGoalsBookInfostyle.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../../../../../resources/css/myPage/MyGoalsWriteTranscriptionstyle.css">

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

    .field input {
      width: 100%;
      height: 100%;
    }

    .modal {
          display: none;
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.5);
          z-index: 1000;
          text-align : center;
        }

        .modal-content {
          position: fixed; /* 수정: 고정 위치로 설정 */
          top: 50%; /* 수정: 화면의 중간 높이 */
          left: 50%; /* 수정: 화면의 중간 너비 */
          transform: translate(-50%, -50%); /* 중앙 정렬을 위한 변환 */
          background-color: #fff;
          padding: 20px;
          border-radius: 8px;
          width: 50%; /* 필요에 따라 크기 조정 */
          box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }


        .close {
          position: absolute;
          top: 10px;
          right: 10px;
          font-size: 20px;
          cursor: pointer;
        }

  </style>
  <title>리플렛 - 도서 정보</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
      <!-- 불변 영역 -->
      <div class="col-auto sidebar d-flex flex-column align-items-start p-0">
        <jsp:include page="/WEB-INF/views/includes/mypagenav/myPageNav.jsp" />
      </div>

      <!-- 가변 영역 -->
      <div class="col content p-4">
        <div class="page-content">
            <div class="page-content2">
              <img class="placeholder-picture" src="../../../../resources/images/myPage/placeholder-picture0.png" />
              <div class="right-column">
                <div class="section-text">
                  <div class="top">
                    <div class="secondary-headline">도서 명</div>

                  </div>
                  <div class="paragraph">작가 명</div>
                </div>

                <form action="/myPage/myGoals/bookInfoRecord" method="post">

                  <div class="form-5-fields-checkbox-button">
                    <div class="fields-group">
                      <div class="text-field">
                        <div class="label-and-field">
                          <div class="label">시작 일자</div>
                          <div class="field">
                            <input type="text" value="시작일자">
                          </div>
                        </div>
                      </div>
                      <div class="text-field">
                        <div class="label-and-field">
                          <div class="label">목표 일자</div>
                          <div class="field">
                            <input type="text" value="목표 일자">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <br>

                  <div class="form-5-fields-checkbox-button">
                    <div class="fields-group">
                      <div class="text-field">
                        <div class="label-and-field">
                          <div class="label">총 페이지</div>
                          <div class="field">
                            <input type="text" value="총 페이지">
                          </div>
                        </div>
                      </div>
                      <div class="text-field">
                        <div class="label-and-field">
                          <div class="label">읽은 페이지</div>
                          <div class="field">
                            <input type="text" value="읽은 페이지">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="buttons-group">
                      <div class="button">
                        <div class="text-container">
                          <input class="button-text" type="submit" value="기록 완료">
                        </div>
                      </div>

                      <div class="buttons-group" style="margin-left:15px;">
                        <div class="button">
                          <div class="text-container">
                            <button class="button-text">목표 삭제</button>
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>

                </form>

              </div>

            </div>

            <div class="header">
              <div class="auto-layout-vertical">
                <div class="secondary-headline">필사 다이어리</div>
              </div>
              <a href="javascript:void(0);" onclick="openModal()">
                <div class="type-primary-size-large-status-enable">
                  <div class="button-text">필사 추가</div>
                </div>
              </a>
            </div>
            <div class="table2">
              <div class="frame-1">

                <div class="column">

                  <div class="kanban">
                    <div class="description-top">2024.11.14</div>
                    <div class="description-top2">필사 문장</div>
                    <div class="description-top3">사용자의 생각 작성란</div>
                    <div class="bottom">
                      <div class="icons-container">
                        <a href="javascript:void(0);" onclick="openModal()">
                          <img class="icon-heroicons-outline-pencil-alt4"
                            src="../../../../resources/images/myPage/icon-heroicons-outline-pencil-alt3.svg" />
                        </a>
                        <a href="/myPage/myGoals/bookInfo/deleteTrans">
                          <img class="icon-heroicons-outline-trash4"
                            src="../../../../resources/images/myPage/icon-heroicons-outline-trash3.svg" />
                        </a>
                      </div>
                    </div>
                  </div>

                  <!-- 카드 1 -->
                  <!-- <div class="kanban">
                    <div class="description-top">2024.11.14</div>
                    <div class="description-top2">필사 문장</div>
                    <div class="description-top3">사용자의 생각 작성란</div>
                    <div class="bottom">
                      <div class="icons-container">
                        <img class="icon-heroicons-outline-pencil-alt" src="icon-heroicons-outline-pencil-alt0.svg" />
                        <img class="icon-heroicons-outline-trash" src="icon-heroicons-outline-trash0.svg" />
                      </div>
                    </div>
                  </div> -->

                  <!-- 카드 2 -->
                  <!-- <div class="kanban">
                    <div class="description-top">2024.11.14</div>
                    <div class="description-top2">필사 문장</div>
                    <div class="description-top3">사용자의 생각 작성란</div>
                    <div class="bottom">
                      <div class="icons-container">
                        <img class="icon-heroicons-outline-pencil-alt2" src="icon-heroicons-outline-pencil-alt1.svg" />
                        <img class="icon-heroicons-outline-trash2" src="icon-heroicons-outline-trash1.svg" />
                      </div>
                    </div>
                  </div> -->

                  <!-- 카드 3 -->
                  <!-- <div class="kanban">
                    <div class="description-top">2024.11.14</div>
                    <div class="description-top2">필사 문장</div>
                    <div class="description-top3">사용자의 생각 작성란</div>
                    <div class="bottom">
                      <div class="icons-container">
                        <img class="icon-heroicons-outline-pencil-alt3" src="icon-heroicons-outline-pencil-alt2.svg" />
                        <img class="icon-heroicons-outline-trash3" src="icon-heroicons-outline-trash2.svg" />
                      </div>
                    </div>
                  </div> -->



                </div>

                <div class="column">
                  <!-- 카드 5 -->
                  <!-- <div class="kanban">
                    <div class="description-top">2024.11.14</div>
                    <div class="description-top2">필사 문장</div>
                    <div class="description-top3">사용자의 생각 작성란</div>
                    <div class="bottom">
                      <div class="icons-container">
                        <img class="icon-heroicons-outline-pencil-alt5" src="icon-heroicons-outline-pencil-alt4.svg" />
                        <img class="icon-heroicons-outline-trash5" src="icon-heroicons-outline-trash4.svg" />
                      </div>
                    </div>
                  </div> -->

                  <!-- 카드 2 -->
                  <!-- <div class="kanban">
                    <div class="description-top">2024.11.14</div>
                    <div class="description-top2">필사 문장</div>
                    <div class="description-top3">사용자의 생각 작성란</div>
                    <div class="bottom">
                      <div class="icons-container">
                        <img class="icon-heroicons-outline-pencil-alt2" src="icon-heroicons-outline-pencil-alt1.svg" />
                        <img class="icon-heroicons-outline-trash2" src="icon-heroicons-outline-trash1.svg" />
                      </div>
                    </div>
                  </div> -->

                  <!-- 카드 3 -->
                  <!-- <div class="kanban">
                    <div class="description-top">2024.11.14</div>
                    <div class="description-top2">필사 문장</div>
                    <div class="description-top3">사용자의 생각 작성란</div>
                    <div class="bottom">
                      <div class="icons-container">
                        <img class="icon-heroicons-outline-pencil-alt3" src="icon-heroicons-outline-pencil-alt2.svg" />
                        <img class="icon-heroicons-outline-trash3" src="icon-heroicons-outline-trash2.svg" />
                      </div>
                    </div>
                  </div> -->

                  <!-- 카드 4 -->
                  <!-- <div class="kanban">
                    <div class="description-top">2024.11.14</div>
                    <div class="description-top2">필사 문장</div>
                    <div class="description-top3">사용자의 생각 작성란</div>
                    <div class="bottom">
                      <div class="icons-container">
                        <img class="icon-heroicons-outline-pencil-alt4" src="icon-heroicons-outline-pencil-alt3.svg" />
                        <img class="icon-heroicons-outline-trash4" src="icon-heroicons-outline-trash3.svg" />
                      </div>
                    </div>
                  </div> -->




                </div>

              </div>

            </div>
          </div>
      </div>
    </div>
  </div>


  <!-- 모달 -->
  <div class="modal" id="myModal" onclick="closeModal(event)">
    <div class="modal-content" onclick="event.stopPropagation()">
      <div class="div-modal">
            <div class="section-text-modal">
              <div class="top-modal">
                <div class="secondary-headline-modal">필사 작성</div>
              </div>
              <div class="paragraph-modal">
                책을 읽고 인상 깊은 문장과 당신의 생각을 담아보세요.
              </div>
            </div>
            <div class="form-5-fields-checkbox-button-modal">
              <div class="text-field-modal">
                <div class="label-and-field-modal">
                  <div class="label-modal">필사 문장</div>
                  <div class="field-modal">
                    <input type="text">
                  </div>
                </div>
              </div>
              <div class="text-field-modal">
                <div class="label-and-field-modal">
                  <div class="label-modal">나의 생각</div>
                  <div class="field-modal">
                    <input type="text">
                  </div>
                </div>
              </div>
              <div class="buttons-group-modal">
                <div class="button-modal">
                  <div class="text-container-modal">
                    <a href="" class="button-text-modal">작성 완료</a>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </div>
  </div>

</body>

<script>
  function openModal() {
    document.getElementById('myModal').style.display = 'block';
  }

  function closeModal(event) {
    // 모달을 클릭한 것이 아닌 배경을 클릭했을 때만 닫힘
    if (event.target === document.getElementById('myModal')) {
      document.getElementById('myModal').style.display = 'none';
    }
  }
  </script>





</html>