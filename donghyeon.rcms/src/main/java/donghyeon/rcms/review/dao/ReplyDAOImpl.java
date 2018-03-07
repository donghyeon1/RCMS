package donghyeon.rcms.review.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.Comment;
import donghyeon.rcms.review.dao.mapper.ReplyMapper;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	@Autowired ReplyMapper replyMapper;

	@Override
	public List<Comment> list() {
		return replyMapper.list();
	}

	@Override
	public void create(Comment co) {
		replyMapper.create(co);
		
	}

	@Override
	public void delete(int commNum) {
		replyMapper.delete(commNum);
		
	}
	

	
	
	
}
