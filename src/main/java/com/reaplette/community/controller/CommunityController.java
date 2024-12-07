package com.reaplette.community.controller;

import com.reaplette.community.service.CommunityService;
import com.reaplette.domain.BoardVO;
import com.reaplette.domain.CommentVO;
import com.reaplette.domain.ReviewVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {

    private final CommunityService communityService;

    // application.properties에서 경로를 가져옵니다.
    @Value("${file.upload-dir}")
    private String uploadDirectory;

    @GetMapping("/main")
    public String communityMain(Model model, HttpSession session) {
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");

        if (loggedInUserId == null) {
            loggedInUserId = "101";
            session.setAttribute("loggedInUserId", loggedInUserId);
        }

        // 인기 게시글, 팔로우한 게시글, 도서 리뷰 및 커뮤니티 게시글 가져오기
        List<BoardVO> popularPosts = communityService.getPopularPosts();
        List<BoardVO> followingPosts = loggedInUserId != null ? communityService.getFollowingPosts(loggedInUserId) : null;
        List<ReviewVO> bookReviews = communityService.getBookReviews();
        List<BoardVO> communityPosts = communityService.getCommunityPosts();

        // JSP로 데이터 전달
        model.addAttribute("postList", popularPosts);
        model.addAttribute("followList", followingPosts);
        model.addAttribute("reviewList", bookReviews);
        model.addAttribute("communityList", communityPosts);

        return "community/communityMain";
    }

    @GetMapping("/newPost")
    public String getCommunityNewPost(HttpSession session) {
        log.info("GET /community/newPost - Accessing community newPost");

        String loggedInUserId = (String) session.getAttribute("loggedInUserId");

        if (loggedInUserId == null) {
            log.info("No user logged in. Redirecting to login.");
            return "redirect:/login";
        }

        return "community/communityNewPost";
    }

    @PostMapping("/submitPost")
    public String submitPost(BoardVO boardVO, @RequestParam("image") MultipartFile image, HttpSession session) {
        log.info("POST /community/submitPost - Submitting new post");

        String loggedInUserId = (String) session.getAttribute("loggedInUserId");

        if (loggedInUserId == null) {
            return "redirect:/login";
        }

        // 이미지 파일 처리
        if (!image.isEmpty()) {
            String imagePath = saveImage(image);
            boardVO.setPostImagePath(imagePath);
        }

        // 로그인한 사용자의 ID 설정
        boardVO.setId(loggedInUserId);
        // 게시글 작성일 자동 설정
        boardVO.setDate(LocalDate.now().toString());

        communityService.savePost(boardVO);

        return "redirect:/community/main";
    }

    // 이미지 저장 로직 (서버에 파일 저장, 경로 반환)
    private String saveImage(MultipartFile image) {
        // 원본 파일명에서 확장자 추출
        String originalFilename = image.getOriginalFilename();
        if (originalFilename == null) {
            log.error("Original filename is null");
            return null;
        }

        // 확장자 추출
        String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
        if (!fileExtension.isEmpty()) {
            fileExtension = fileExtension.toLowerCase();
        } else {
            fileExtension = ".jpg";  // 확장자가 없는 경우 기본 .jpg 사용
        }

        // 고유한 파일명 생성 (UUID)
        String newFilename = UUID.randomUUID().toString() + fileExtension;

        // 실제 저장될 경로 (D:/reapletteImages 디렉토리)
        String imagePath = uploadDirectory + File.separator + newFilename;

        // 이미지 파일 저장
        try {
            File file = new File(imagePath);
            // 디렉토리가 존재하지 않으면 생성
            if (!file.getParentFile().exists()) {
                boolean dirCreated = file.getParentFile().mkdirs();
                if (!dirCreated) {
                    log.error("Failed to create directory: " + file.getParentFile().getAbsolutePath());
                    return null;
                }
            }

            image.transferTo(file);  // 이미지 파일을 서버에 저장
        } catch (IOException e) {
            log.error("Image saving failed: " + e.getMessage());
            return null;  // 이미지 저장 실패 시 처리
        }

        // 이미지 경로를 '/images/파일명' 형태로 반환 (웹에서 접근할 수 있도록)
        return "/images/" + newFilename;
    }


    @GetMapping("/viewPost/{postId}")
    public String getCommunityViewPost(@PathVariable("postId") int postId,
                                       HttpSession session, // HttpSession을 사용하여 세션 데이터 접근
                                       Model model) {
        log.info("GET /community/viewPost/{postId} - Viewing post {}", postId);

        // 세션에서 로그인한 사용자 정보 가져오기
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");

        // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
        if (loggedInUserId == null) {
            log.info("No user logged in. Redirecting to login.");
            return "redirect:/login";
        }

        // 게시글 조회
        BoardVO post = communityService.getPostById(postId);
        if (post == null) {
            log.error("Post with ID {} not found", postId);
            return "redirect:/community/main"; // 게시글이 없는 경우 메인 페이지로 리다이렉트
        }

        // 게시글 작성자와 로그인한 사용자가 동일한지 확인
        boolean isAuthor = post.getId().equals(loggedInUserId);

        // 댓글 목록 가져오기
        List<CommentVO> comments = communityService.getCommentsByPostId(postId);

        // JSP에 데이터 전달
        model.addAttribute("post", post);
        model.addAttribute("comments", comments);
        model.addAttribute("isAuthor", isAuthor);
        model.addAttribute("loggedInUserId", loggedInUserId);

        return "community/communityViewPost";
    }
//    @PostMapping("/viewPost/{postId}/like")
//    public String likePost(@PathVariable Long postId,
//                           @SessionAttribute(name = "loggedInUserId", required = false) String loggedInUserId) {
//        log.info("POST /community/viewPost/{}/like - Liking post", postId);
//
//        if (loggedInUserId == null) {
//            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 리다이렉트
//        }
//
//        // 게시글 좋아요 추가
//        communityService.addPostLike(postId, loggedInUserId);
//
//        return "redirect:/community/viewPost/" + postId;
//    }
//
//    // 게시글 좋아요 취소
//    @PostMapping("/viewPost/{postId}/unlike")
//    public String unlikePost(@PathVariable Long postId,
//                             @SessionAttribute(name = "loggedInUserId", required = false) String loggedInUserId) {
//        log.info("POST /community/viewPost/{}/unlike - Unliking post", postId);
//
//        if (loggedInUserId == null) {
//            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 리다이렉트
//        }
//
//        // 게시글 좋아요 삭제
//        communityService.removePostLike(postId, loggedInUserId);
//
//        return "redirect:/community/viewPost/" + postId;
//    }
//
//    // 댓글 작성 처리
//    @PostMapping("/viewPost/{postId}/commentWrite")
//    public String commentWrite(@PathVariable Long postId, @SessionAttribute(name = "loggedInUserId", required = false) String loggedInUserId,
//                               String commentContent) {
//        log.info("POST /community/viewPost/{}/commentWrite - Writing comment", postId);
//
//        if (loggedInUserId == null) {
//            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 리다이렉트
//        }
//
//        // 댓글 작성
//        communityService.writeComment(postId, loggedInUserId, commentContent);
//
//        return "redirect:/community/viewPost/" + postId; // 댓글 작성 후 다시 게시글 페이지로 리다이렉트
//    }
//
//    // 댓글 삭제
//    @PostMapping("/viewPost/{postId}/commentDelete/{commentId}")
//    public String commentDelete(@PathVariable Long postId, @PathVariable Long commentId,
//                                @SessionAttribute(name = "loggedInUserId") String loggedInUserId) {
//        log.info("POST /community/viewPost/{}/commentDelete/{} - Deleting comment", postId, commentId);
//
//        // 댓글 작성자와 로그인한 사용자 확인
//        if (communityService.isCommentAuthor(commentId, loggedInUserId)) {
//            communityService.deleteComment(commentId);
//        }
//
//        return "redirect:/community/viewPost/" + postId; // 댓글 삭제 후 게시글 페이지로 리다이렉트
//    }
//}
}
