package com.reaplette.search.controller;

//import com.reaplette.dao.BoardDAO;
//import com.reaplette.dao.UserDAO;
import com.reaplette.domain.BoardVO;
import com.reaplette.domain.FollowVO;
import com.reaplette.domain.UserVO;
import com.reaplette.mypage.service.MyPageService;
import com.reaplette.search.service.SearchService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.*;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private final SearchService searchService;
    private final MyPageService myPageService;


    private final List<FollowVO> followList = new ArrayList<>();  // 임시 팔로우 상태 저장

    // /search/total -> search/searchMain.jsp로 이동
    @GetMapping("/total")
    public String searchMain(HttpSession session) {
        UserVO userVO = new UserVO();
        //System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");

        session.setAttribute("user",myPageService.getUser("test@naver.com"));
        return "search/searchMain";
    }

    // /search/total/book -> search/total/searchBook.jsp로 이동
    @GetMapping("/total/book")
    public String searchBook() {
       //System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
        return "search/total/searchBook";
    }

    // /search/total/author -> search/total/searchAuthor.jsp로 이동
    @GetMapping("/total/author")
    public String searchAuthor(){//Model model
        //model.addAttribute("authorBooks", new ArrayList<>());
        //System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
        return "search/total/searchAuthor";
    }

    // /search/total/post -> search/total/searchPost.jsp로 이동
    @GetMapping("/total/post")
    public String searchPost(@RequestParam(value = "sort", required = false, defaultValue = "latest") String sort,
                             Model model) {
        //BoardDAO boardDAO = new BoardDAO();
        //UserDAO userDAO = new UserDAO();

        // 게시글 데이터 가져오기
        //List<BoardVO> boardList = boardDAO.getBoardList(sort);


       // model.addAttribute("boardList", boardList); // 게시글 리스트 전달
       // model.addAttribute("userMap", userMap); // 사용자 ID와 UserVO의 매핑 전달
      //  model.addAttribute("totalResults", boardList.size()); // 결과 개수
     //   model.addAttribute("sort", sort); // 정렬 기준

        return "search/total/searchPost";
    }



    // /search/total/user -> search/total/searchUser.jsp로 이동
    @GetMapping("/total/user")
    public String searchUser(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword, Model model, HttpSession session) {
        // 사용자 목록 가져오기

        List<UserVO> userList = searchService.getAllUsers(keyword);
        List<FollowVO> followList = searchService.getFollowList(myPageService.getUser("test@naver.com").getId());
        //model.addAttribute("keyword",keyword);

        // JSP에 전달
        model.addAttribute("userList", userList);
        model.addAttribute("followList", followList);

       log.info("검색된 사용자 수: " + userList);
       log.info("팔로우 : " + followList);

        return "search/total/searchUser"; // JSP 파일로 이동
    }

    // /search/total/user/follow -> search/total/searchUser.jsp로 이동 (POST 요청)
    @PostMapping("/total/user/follow")
    public ResponseEntity<String> follow(@RequestBody FollowVO followVO) {
        log.info("follow");
        String followingId = followVO.getFollowingId();  // 팔로우할 사용자 ID
        String followerId = followVO.getFollowerId();  // 현재 사용자 ID (팔로워)
        log.info("followingId : ",followingId);
        log.info("followerId : ", followerId);

        return ResponseEntity.ok("팔로우 요청이 성공적으로 처리되었습니다.");
    }

    // /search/total/book/detail -> search/total/searchBook/bookDetail.jsp로 이동
    @GetMapping("/total/book/detail")
    public String bookDetail() {
        System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
        return "search/total/searchBook/bookDetail";
    }

    // /search/total/book/bookMark -> search/total/searchBook/bookDetail.jsp로 이동 (POST 요청)
    @PostMapping("/total/book/bookMark")
    public String bookMark() {
        return "search/total/searchBook/bookDetail";
    }

    // /search/total/book/review -> search/total/searchBook/bookDetail.jsp로 이동 (POST 요청)
    @PostMapping("/total/book/review")
    public String addReview() {
        return "search/total/searchBook/bookDetail";
    }

    // /search/total/book/reviewLike -> search/total/searchBook/bookDetail.jsp로 이동 (POST 요청)
    @PostMapping("/total/book/reviewLike")
    public String likeReview() {
        return "search/total/searchBook/bookDetail";
    }

    // /search/total/book/reviewDelete -> search/total/searchBook/bookDetail.jsp로 이동 (POST 요청)
    @PostMapping("/total/book/reviewDelete")
    public String deleteReview() {
        return "search/total/searchBook/bookDetail";
    }
}


//    // 통합 검색 메인 페이지
//    @GetMapping("/")
//    public String searchMain(Model model) {
//        // Book, Author, Post, User 리스트를 비어있는 상태로 초기화
//        List<String> bookList = new ArrayList<>();
//        List<String> authorList = new ArrayList<>();
//        List<String> postList = new ArrayList<>();
//        List<String> userList = new ArrayList<>();
//
//        // 데이터 모델에 추가
//        model.addAttribute("bookList", bookList);
//        model.addAttribute("authorList", authorList);
//        model.addAttribute("postList", postList);
//        model.addAttribute("userList", userList);
//        model.addAttribute("currentPage", 1); // 현재 페이지
//        model.addAttribute("totalPages", 10); // 총 페이지 수
//
//        return "search/searchMain"; // JSP 경로에 맞게 반환
//    }
//
//    // Author 탭 클릭 시 작가 페이지로 이동
//    @GetMapping("/total/author")
//    public String searchAuthor(Model model) {
//        List<String> authorList = new ArrayList<>();
//
//        // 작가 리스트를 모델에 추가
//        model.addAttribute("authorList", authorList);
//
//        return "search/total/searchAuthor"; // Author 관련 JSP 반환
//    }
//
//    // Book 탭 클릭 시 도서 페이지로 이동
//    @GetMapping("/total/book")
//    public String searchBook(Model model) {
//        List<String> bookList = new ArrayList<>();
//
//        // 도서 리스트를 모델에 추가
//        model.addAttribute("bookList", bookList);
//
//        return "search/total/searchBook"; // Book 관련 JSP 반환
//    }
//
//    // Post 탭 클릭 시 게시물 페이지로 이동
//    @GetMapping("/total/post")
//    public String searchPost(Model model) {
//        List<String> postList = new ArrayList<>();
//
//        // 게시물 리스트를 모델에 추가
//        model.addAttribute("postList", postList);
//
//        return "search/total/searchPost"; // Post 관련 JSP 반환
//    }
//
//    // Users 탭 클릭 시 사용자 페이지로 이동
//    @GetMapping("/total/user")
//    public String searchUser(Model model) {
//        List<String> userList = new ArrayList<>();
//
//        // 사용자 리스트를 모델에 추가
//        model.addAttribute("userList", userList);
//
//        return "search/total/searchUser"; // Users 관련 JSP 반환
//    }



