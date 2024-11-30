function previewProfileImage() {
  const fileInput = document.getElementById('profileimage');
  const preview = document.getElementById('profilePreview');

  if (fileInput.files && fileInput.files[0]) {
    const reader = new FileReader();
    
    reader.onload = function(e) {
      preview.src = e.target.result; // 선택한 파일을 이미지로 표시
    };
    
    reader.readAsDataURL(fileInput.files[0]);
  }
}

function deleteProfilePreview() {
  // 링크 클릭 기본 동작 방지
  event.preventDefault();

  // 미리보기 이미지 경로 설정
  const imagePath = '../../../resources/images/myPage/icon-jam-icons-outline-logos-user1.svg';

  // 이미지 미리보기 요소를 가져오기
  const imagePreview = document.getElementById('profilePreview');

  // 이미지 경로를 설정하고 미리보기를 보여줍니다.
  imagePreview.src = imagePath;

  // 기본 이미지 경로로 설정
  const fileInput = document.getElementById('profileimage');
  fileInput.value = imagePath; // 선택된 파일의 전체 경로를 반환하지 않음, 파일의 이름만 반환됩니다.



}

// 이벤트 리스너 등록
document.getElementById('deleteProfileLink').addEventListener('click', deleteProfilePreview);

