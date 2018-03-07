package donghyeon.rcms.question.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Question;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.common.service.PageService;
import donghyeon.rcms.question.domain.Qsearch;
import donghyeon.rcms.question.service.QnaService;



@Controller
public class QnaController {
	@Autowired private QnaService qnaService;
	@Autowired private PageService pageService;
	
	@RequestMapping("/qnaList")
	public String qnaPage(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		
		Page myPage=null;
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
		else myPage = new Page();
		
		pageService.setQstPageServiceImpl(5, myPage);
		request.setAttribute("pageMaker", pageService);
		request.setAttribute("qnaList", qnaService.getQuestions(myPage));
		
		return "question/qnalist";
	}
	
	@ResponseBody
	@RequestMapping("qnalists")
	public List<Question> qnalists(){
		return qnaService.qnalists();
	}
	
	@RequestMapping(value="qnacreate",method=RequestMethod.GET)
	public String createGET(Question qa,Model model,HttpServletRequest request,HttpSession session)throws Exception{
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		return "question/qnacreate";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/qnacreate",method=RequestMethod.POST)
	public String createPOST(Question qa,Model model)throws Exception{
		qnaService.creates(qa);
		model.addAttribute("result","성공");
		return "question/qnacreate";
	}
	
	@ResponseBody
	@RequestMapping(value="createInsrt",method=RequestMethod.POST)
	public String create(Question qa,HttpSession session){
		User user = (User)session.getAttribute("user");
		qa.setUserId(user.getUserId());
		qnaService.creates(qa);
		return "result";
	}
	
	 @RequestMapping(value="qnaView", method=RequestMethod.GET)
    public ModelAndView view(@RequestParam int qstNum,HttpServletRequest request,HttpSession session) throws Exception{		 
        
        // 모델(데이터)+뷰(화면)를 함께 전달하는 객체
        ModelAndView mav = new ModelAndView();
        // 뷰의 이름
        mav.setViewName("question/qnaview");
        // 뷰에 전달할 데이터
        mav.addObject("qnaview", qnaService.writeInfo(qstNum));
        return mav;
    }
	 
	//수정
	 @RequestMapping(value="qnaupdateOpen")
	 public String openUpdate(Model model,@RequestParam int qstNum,HttpServletRequest request,HttpSession session){
		 User user = (User)session.getAttribute("user");
			if(user==null){
				request.setAttribute("msg", "로그인이 필요합니다.");
				return "forward:login";
			}
		 
		 Question question = qnaService.writeInfo(qstNum);
		 model.addAttribute("question",question);
		 return "question/qnaupdate";
	 }
	 
	//수정
	 @ResponseBody
	 @RequestMapping(value="qnaupdate",method=RequestMethod.POST)
	 public String update(Question qa, HttpSession session, HttpServletRequest request){
		 qnaService.fixupdate(qa);
		 return "forward:/question";
	 }
	 
	 
	 
	 //삭제
	 @RequestMapping(value="/delete")
	 public String delete(int qstNum,HttpServletRequest request,HttpSession session){
		 User user = (User)session.getAttribute("user");
			if(user==null){
				request.setAttribute("msg", "로그인이 필요합니다.");
				return "forward:login";
			}
		 qnaService.secede(qstNum);
		 return "redirect:qnaList";
	 }
	 
	 //관리자 답변등록
	 @ResponseBody
	 @RequestMapping("answerInsert")
	 public boolean answerInsert(Question qst){
		 System.out.println(qst);
		 return qnaService.updateAnswer(qst)>=1;
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/qSearch")
	 public List<Question> searchQuestion(Qsearch qsearch) {
		 System.out.println(qsearch);
		return qnaService.searchQuestion(qsearch);
	}	
}
