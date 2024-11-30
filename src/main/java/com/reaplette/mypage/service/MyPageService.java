package com.reaplette.mypage.service;

import com.reaplette.domain.UserVO;
import com.reaplette.mypage.mappers.MyPageMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class MyPageService {

    private final MyPageMapper userMapper; // 자동 주입

    public UserVO getUser(String id) {
        log.info("getUser....." + id);
        return userMapper.getUser(id);
    }

    public int setUser(UserVO user, MultipartFile profileImagePathForm) {
        // 파일 경로 설정
        // 서버에 올릴 땐 다르게 올려야 합니다.
        String uploadDir =
        String fileName = profileImagePathForm.getOriginalFilename();
        File file = new File(uploadDir + fileName);

        // 파일 저장
        try {
            profileImagePathForm.transferTo(file);
            log.info("File saved to: " + file.getAbsolutePath());
        } catch (IOException e) {
            log.error("Error while saving file", e);
            return -1; // 에러 코드 반환 (예시)
        }
        // 이미지 경로를 사용자 객체에 설정
        user.setProfileImagePath("/resources/images/myPage/users/" + fileName);


        // 프로필 사진 제외 정보 주입
        log.info("setUser....." + user);
        return userMapper.setUser(user);
    }
}
