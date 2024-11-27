$(document).ready(function () {
  followHandle(); // 팔로우/언팔로우 처리
});

function followHandle() {
  // 팔로우/언팔로우 버튼 클릭 처리
  $(document).on("click", ".userFollow", function (event) {
    event.preventDefault(); // 폼 기본 동작(페이지 이동) 방지

    const form = $(this).closest("form"); // 버튼이 포함된 폼 선택
    const _this = $(this);
    const isFollowing = _this.hasClass("following");

    // 버튼 상태 및 스타일 변경
    if (isFollowing) {
      _this.removeClass("following"); // 팔로잉 클래스 제거
      _this.text("팔로우");
    } else {
      _this.addClass("following"); // 팔로잉 클래스 추가
      _this.text("팔로잉");
    }

    // 폼 전송
    form.submit();
  });
}
