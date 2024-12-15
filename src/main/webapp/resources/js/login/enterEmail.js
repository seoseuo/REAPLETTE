const form = document.getElementById("login-form");
const errorElement = document.getElementById("email-error");
const clearIcon = document.getElementById("clear-icon");
const submitButton = document.getElementById("start-button");
const naverButton = document.getElementById("naver-button");
const idInput = document.getElementById("id");

// 알럿 메시지 표시
document.addEventListener("DOMContentLoaded", () => {
    const urlParams = new URLSearchParams(window.location.search);
    const alertMessage = urlParams.get("alertMessage");

    if (alertMessage) {
        alert(decodeURIComponent(alertMessage));
    }
});

form.addEventListener("submit", async (event) => {
    event.preventDefault(); // 폼 기본 제출 동작 방지

    const idInput = document.getElementById("id").value.trim();
    if (!idInput) {
        showError("이메일을 입력하지 않았습니다.");
        return;
    }

    if (!validateEmail(idInput)) {
        showError("올바른 이메일 형식이 아닙니다.");
        return;
    }

    try {
        const url =`/login/loginTypeCheck?id=${encodeURIComponent(idInput)}`;
        const response = await fetch(url, { method: "GET" });

        if (!response.ok) {
            throw new Error("AJAX 요청 실패");
        }

        const data = await response.json();
        if (data.isNaver) {
            showError("네이버 계정으로 가입한 사용자입니다. 네이버 로그인으로 진행하세요.");
        } else {
            form.submit(); // 폼 제출
        }
    } catch (error) {
        console.error("AJAX 요청 중 오류 발생:", error);
    }
});

naverButton.addEventListener("click", async () => {
    const idInput = document.getElementById("id").value.trim();

    if (!idInput) {
        showError("이메일을 입력하지 않았습니다.");
        return;
    }

    if (!validateEmail(idInput)) {
        showError("올바른 이메일 형식이 아닙니다.");
        return;
    }

    try {
        const url =`/login/loginTypeCheck?id=${encodeURIComponent(idInput)}`;
        const response = await fetch(url, { method: "GET" });

        if (!response.ok) {
            throw new Error("AJAX 요청 실패");
        }

        const data = await response.json();
        console.log("Server Response:", data); // 디버깅 메시지

         if (!data.exists || data.isNaver) {
            window.location.href = "/login/naver"; // 네이버 로그인 리디렉션
        } else {
            // 일반 사용자
            showError("일반 계정으로 가입한 사용자입니다. 시작하기 버튼을 눌러 진행하세요.");
        }
    } catch (error) {
        // AJAX 요청 오류 처리
        console.error("AJAX 요청 중 오류 발생:", error);
        showError("서버와의 통신 중 문제가 발생했습니다. 다시 시도해주세요.");
    }
});

// 유효성 검사 함수
function validateEmail(id) {
    const emailRegex = /^(?!.*\.\.)(?!\.)[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    return emailRegex.test(id);
}

// 오류 메시지 처리 함수
function showError(message) {
    errorElement.innerHTML = message;  // 오류 메시지 설정
    setTimeout(() => {
        clearError(); // 3초 후 clearError 호출
    }, 3000);
}

// 클리어 아이콘 클릭 시 입력값 비우기
clearIcon.addEventListener("click", () => {
    idInput.value = "";
    clearIcon.style.display = "none";
    clearError();
});

function clearError() {
    errorElement.textContent = ''; // 텍스트 초기화
}

idInput.addEventListener("input", () => {
    clearIcon.style.display = idInput.value ? "block" : "none";
});

