package com.reaplette.mypage.mappers;

import com.reaplette.domain.UserVO;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageMapper {
    // User 정보 가져오기
    UserVO getUser(String id);
    int setUser(UserVO user);
}
