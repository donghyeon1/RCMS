package donghyeon.rcms.review.service;

import java.util.List;
import donghyeon.rcms.common.domain.Comment;



public interface ReplyService {

    public List<Comment> list();
    public void create(Comment co);
    public void delete(int commNum);
}
