package com.reaplette.mappers;

import com.reaplette.domain.UserVO;
import com.reaplette.mypage.mappers.MyPageMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@SpringBootTest
public class MyPageMapperTests {

    private static final Logger logger = LoggerFactory.getLogger(MyPageMapperTests.class);

    @Autowired
    private MyPageMapper myPageMapper;

    @Test
    public void testGetUser() {
        // 테스트용 데이터 ID (데이터베이스에 존재하는 ID 사용)
        String testId = "test@naver.com";

        // 메서드 호출
        UserVO user = myPageMapper.getUser(testId);

        // 결과 검증
        assertNotNull(user, "User should not be null");
        // UserVO 객체의 모든 정보를 로그로 출력
        if (user != null) {
            logger.info("User ID: " + user.getId());
            logger.info("Password: " + user.getPw());
            logger.info("Username: " + user.getUsername());
            logger.info("Profile Image Path: " + user.getProfileImagePath());
            logger.info("Sign In Date: " + user.getSignInDate());
            logger.info("Is Delete: " + user.getIsDelete());
            logger.info("Follower Count: " + user.getFollowerCount());
            logger.info("Following Count: " + user.getFollowingCount());
        }
        // User ID 확인
        assertEquals(testId, user.getId(), "User ID should match the test ID");
    }
}
