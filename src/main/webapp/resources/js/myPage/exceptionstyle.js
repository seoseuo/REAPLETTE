document.addEventListener("DOMContentLoaded", () => {
  // 폼 검증을 수행하는 함수
  function validateForm() {
    const form = document.querySelector("#myInfo"); // ID가 myInfo인 폼 요소 선택
    const profileImageInput = document.querySelector("#profileimage");
    const nameInput = document.querySelector("#name");
    const pwInput = document.querySelector("#pw");
    const pwCheckInput = document.querySelector("#pw-check");

    let isValid = true; // 초기 상태는 유효함

    // Validate profile image (no special handling if empty)
    if (!validateProfileImage(profileImageInput.files[0])) {
      isValid = false;
    }

    // Validate name
    if (!validateName(nameInput.value)) {
      isValid = false;
    }

    // Validate password
    if (!validatePassword(pwInput.value)) {
      isValid = false;
    }

    // Validate password confirmation
    if (!validatePasswordConfirmation(pwInput.value, pwCheckInput.value)) {
      isValid = false;
    }

    // If all validations pass, submit the form
    if (isValid) {
      form.submit(); // 폼 제출
    } else {
      console.log("폼 제출 실패: 유효성 검증 오류");
    }
  }

  // 프로필 이미지 검증 함수
  function validateProfileImage(file) {
    // 프로필 이미지가 선택되지 않은 경우 별도의 처리는 하지 않음
    if (file && !file.name) {
      return false;
    }

    const allowedExtensions = ["jpg", "png"];
    const maxSizeMB = 2;

    if (file) {
      const fileName = file.name.toLowerCase();
      const fileExtension = fileName.split(".").pop();
      if (!allowedExtensions.includes(fileExtension)) {
        document.getElementById("profile-exception-field").textContent = "JPG 또는 PNG 파일만 업로드 가능합니다.";
        return false;
      }

      if (file.size > maxSizeMB * 1024 * 1024) {
        document.getElementById("profile-exception-field").textContent = `파일 용량은 ${maxSizeMB}MB 이하여야 합니다.`;
        return false;
      }

      document.getElementById("profile-exception-field").textContent = "";
      return true;
    }

    // 프로필 이미지가 입력되지 않았을 때는 오류 처리하지 않음
    document.getElementById("profile-exception-field").textContent = "";
    return true;
  }

  // 이름 검증 함수
  function validateName(name) {
    if (name.trim() === "") {
      document.getElementById("name-exception-field").textContent = "이름을 입력해주세요.";
      return false;
    }

    const nameRegex = /^[a-zA-Z가-힣]{1,10}$/;
    if (!nameRegex.test(name)) {
      document.getElementById("name-exception-field").textContent = "이름은 한글 또는 영어 10글자 이내로 작성해주세요.";
      return false;
    }

    document.getElementById("name-exception-field").textContent = "";
    return true;
  }

  // 비밀번호 검증 함수
  function validatePassword(password) {
    if (password.trim() === "") {
      document.getElementById("pw-exception-field").textContent = "비밀번호를 입력해주세요.";
      return false;
    }

    const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
    if (!pwRegex.test(password)) {
      document.getElementById("pw-exception-field").textContent = "비밀번호는 영문, 숫자, 특수문자를 혼용하여 8~20자로 작성해주세요.";
      return false;
    }

    document.getElementById("pw-exception-field").textContent = "";
    return true;
  }

  // 비밀번호 확인 검증 함수
  function validatePasswordConfirmation(password, passwordConfirmation) {
    if (passwordConfirmation.trim() === "") {
      document.getElementById("pw-check-exception-field").textContent = "비밀번호 확인을 입력해주세요.";
      return false;
    }

    if (password !== passwordConfirmation) {
      document.getElementById("pw-check-exception-field").textContent = "비밀번호가 일치하지 않습니다.";
      return false;
    }

    document.getElementById("pw-check-exception-field").textContent = "";
    return true;
  }

  // 기본 프로필 클릭 시 파일 입력의 value 설정
  const defaultProfileLink = document.querySelector("a[href='']"); // 기본 프로필 링크 선택
  const profileImageInput = document.querySelector("#profileimage");

  if (defaultProfileLink) {
    defaultProfileLink.addEventListener("click", (e) => {
      e.preventDefault(); // 링크 클릭 기본 동작 방지
      // 파일 선택 창을 트리거하지 않고 기본 경로로 설정할 수 있는 방법은 없으므로,
      // 이미지 경로를 표시하는 것으로 대체 가능
      profileImageInput.value = ''; // 파일 입력 초기화
      console.log("기본 프로필이 설정되었습니다.");
    });
  }

  // 폼 제출 이벤트 리스너 추가
  const form = document.querySelector("#myInfo");
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // 기본 폼 제출 동작 방지
    validateForm(); // 폼 검증 함수 호출
  });
});