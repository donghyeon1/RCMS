package donghyeon.rcms.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.common.service.PageService;
import donghyeon.rcms.common.service.PageServiceImpl;
import donghyeon.rcms.review.domain.Search;
import donghyeon.rcms.review.service.ReviewService;
import donghyeon.rcms.review.service.ReviewServiceImpl;

@Controller
public class ReviewController {
	@Autowired ReviewService reviewService;
	@Autowired PageService pageService;
	
	@RequestMapping("/review")
	public String reviewMain(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		
		Page myPage=null;
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
		else myPage = new Page();
		
		pageService.setPageServiceImpl(5, myPage);
		request.setAttribute("pageMaker", pageService);
		request.setAttribute("reviews", reviewService.getReviews(myPage));
		return "review/reviewMain";
	}
	//리스트
	@RequestMapping("rvlist")
	@ResponseBody
	public List<Review> rvlist() throws Exception{ 
		List<Review> rvall = reviewService.listAll();
		return rvall;
	}
	//쓰기
    @RequestMapping("/rvwriter")
    public String writePage(HttpServletRequest request,HttpSession session){
    	User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
    	return "review/reviewWriter";
    }
    
    //등록
    @ResponseBody
    @RequestMapping(value="rvwriterInsrt", method=RequestMethod.POST)
    public String write(Review rv, HttpSession session){
    	System.out.println(rv.getRevTitle()+"컨트롤러 타이틀");
    	System.out.println(rv.getRevContent()+"컨트롤러 컨텐트");
    	User user = (User)session.getAttribute("user");
    	System.out.println(user.getUserId()+"유저 아이디");    	
    	rv.setUserId(user.getUserId());

        reviewService.create(rv);
        return "result";
    }
    
    //상세보기
    @RequestMapping(value="/rvView")
    public String read(int revNum,Model model,HttpServletRequest request,HttpSession session){
    	User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
    	Review review=reviewService.read(revNum);
    	model.addAttribute("review",review);
    	return "review/reviewView";
    	
    }
    
    //삭제
	@RequestMapping(value="rvDel")
	public String reDel(int revNum,HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		System.out.println(revNum);
		reviewService.delete(revNum);
		return "redirect:/review";
	}
	
	//수정화면
	@RequestMapping(value="rvUpdateOpen")
	public String openUpdate(Model model,int revNum,HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		Review review=reviewService.read(revNum);
    	model.addAttribute("review",review);
        return "review/reviewUpdate";   	
	}
	
	//실제수정
	@ResponseBody
	@RequestMapping(value="rvUpdate", method=RequestMethod.POST)
	public String update(Review rv, HttpSession session){ 	
	    reviewService.update(rv);
	    return "result";
	}
	
	//검색버튼
	@ResponseBody
	@RequestMapping(value="/rvSearch")
	public List<Review> search(Search search){
		System.out.println(search);
		return reviewService.searchReview(search);
	}
}
