package com.reaplette.mappers;

import com.reaplette.domain.UserVO;
import com.reaplette.mypage.mappers.MyPageMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@SpringBootTest
@Transactional  // 테스트 후 데이터 롤백
public class MyPageMapperTests {

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
        assertEquals(testId, user.getId(), "User ID should match the test ID");
    }
}
