package donghyeon.rcms.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.domain.Comment;
import donghyeon.rcms.review.dao.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{	
	@Autowired ReplyDAO replyDAO;
	
	@Override
	public List<Comment> list() {		
		return replyDAO.list();
	}

	@Override
	public void create(Comment co) {
		replyDAO.create(co);
	}

	@Override
	public void delete(int commNum) {
		replyDAO.delete(commNum);
	}
}
