package com.reaplette.search.service;

import com.reaplette.domain.FollowVO;
import com.reaplette.domain.UserVO;
import com.reaplette.search.mappers.SearchMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class SearchService {
    private final SearchMapper searchMapper;

    public List<UserVO> getAllUsers(String userName) {
        List<UserVO> userList = searchMapper.getAllUsers(userName);
        if (userList== null || userList.isEmpty()) {
            throw new IllegalStateException("사용자 목록이 비어 있습니다.");
        }
        log.info("getAllUsers 호출...");
        return searchMapper.getAllUsers(userName);
    }

    public List<FollowVO> getFollowList(String userId){
        log.info("getFollowList 호출...");
        return searchMapper.getFollowList(userId);
    }

//    private final SearchMapper userMapper; // 자동 주입
//
//    public UserVO getUser(String id) {
//        log.info("getUser....." + id);
//        return userMapper.getUser(id);
//    }
}
