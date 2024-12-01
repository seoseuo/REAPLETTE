package com.reaplette.mypage.mappers;

import com.reaplette.domain.UserVO;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface MyPageMapper {
    // User 정보 가져오기
    UserVO getUser(String id);
    void setUser(UserVO user);
    boolean isUsernameExists(String username);
}


