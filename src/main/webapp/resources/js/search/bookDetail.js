document.addEventListener("DOMContentLoaded", function () {
/**
 * 상세 이미지 더보기/접기 기능
 */
const setupImageToggle = () => {
  const toggleButton = document.getElementById("toggleButton");
  const hiddenImages = document.getElementById("hiddenImages");

  let isExpanded = false;

  toggleButton.addEventListener("click", function () {
    if (isExpanded) {
      hiddenImages.style.height = "150px"; // 축소
      toggleButton.textContent = " 상세 이미지 더보기 ";
    } else {
      hiddenImages.style.height = "auto"; // 확장
      toggleButton.textContent = " 상세 이미지 접기 ";
    }
    isExpanded = !isExpanded;
  });
};

/**
 * 이미지 클릭 시 모달 열기/닫기 기능
 */
const setupImageModal = () => {
  document.querySelectorAll(".clickable-image").forEach((image) => {
    image.addEventListener("click", function () {
      const modal = document.getElementById("imageModal");
      const modalImg = document.getElementById("modalImage");

      modal.style.display = "flex";
      modalImg.src = this.src; // 클릭된 이미지 경로 설정
    });
  });

  document.querySelector(".close").addEventListener("click", function () {
    const modal = document.getElementById("imageModal");
    modal.style.display = "none"; // 모달 숨기기
  });
};
  // 실행
  setupImageToggle();
  setupImageModal();
});


function insertReview() {
  $('#reviewBtn').on('submit', function (event) {
    alert("test");
    event.preventDefault(); // 폼의 기본 제출 동작 방지

    const requestData = {
      title: $('#title').val(),
      content: $('#content').val()
    };

    $.ajax({
      url: '/search/total/book/detail/review',
      method: 'POST',
      contentType: 'application/json',
      data: JSON.stringify(requestData),
      success: function (response) {
        $('#responseMessage').text('Review submitted successfully!');
        console.log('Success:', response);
      },
      error: function (xhr, status, error) {
        $('#responseMessage').css('color', 'red').text('Failed to submit review.');
        console.error('Error:', xhr.responseText || error);
      }
    });
  });
}

// 리뷰 삭제
function deleteReview(reviewId) {
    $.ajax({
          url: '/search/total/book/detail/review/delete',
          method: 'POST',
          contentType: 'application/json; charset=UTF-8',
          data: JSON.stringify({"reviewId": reviewId}),
          success: function (response) {
              var rsCd = response.rsCd;
              if(rsCd == "success") {
                  $("#form_" + reviewId).remove();
              } else if(rsCd == "noEdit") {
                  alert("삭제 권한이 없습니다.");
              } else {
                  alert("로그인이 필요합니다.");
              }
          },
          error: function (xhr, status, error) {
              alert("오류가 발생하였습니다.");
              console.log("error : " + error);
          }
    });
}

// 좋아요 등록/취소
function updateLike(reviewId) {
    $.ajax({
          url: '/search/total/book/detail/review/like',
          method: 'POST',
          contentType: 'application/json; charset=UTF-8',
          data: JSON.stringify({"reviewId": reviewId}),
          success: function (response) {
              if(response.rsCd == "success") {
                  $("#cnt_" + reviewId).text(response.cnt);
                  } else if (response.rsCd === "notLogin") {
                      // 로그인 필요 메시지와 페이지 리다이렉트
                      alert("로그인이 필요합니다.");
                      window.location.href = '/login/enterEmail'; // 로그인 페이지로 리다이렉트
                  }
//               } else {
//                   alert("로그인이 필요합니다.");
//               }
          },
          error: function (xhr, status, error) {
              alert("오류가 발생하였습니다.");
              console.log("error : " + error);
          }
    });
}
