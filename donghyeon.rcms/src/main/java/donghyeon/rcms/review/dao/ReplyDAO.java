package donghyeon.rcms.review.dao;

import java.util.List;
import donghyeon.rcms.common.domain.Comment;


public interface ReplyDAO {
    // 댓글 목록
    public List<Comment> list();
    // 댓글 입력
    public void create(Comment co);
    // 댓글 삭제
    public void delete(int commNum);
 
 
}
