package donghyeon.rcms.review.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import donghyeon.rcms.common.domain.Comment;


public interface ReplyMapper {
    // 댓글 목록
    @Select("select comm_num commNum, rev_num revNum, comm_content commContent, comm_regdate  commRegdate, user_id userId from comments order by comm_regdate")
	public List<Comment> list();
    
    @Insert("insert into comments "
			+ "values (comments_seq.NEXTVAL, "
			+ "#{commContent,jdbcType=VARCHAR}, "
			+ "sysdate, #{revNum}, "
			+ "#{userId,jdbcType=VARCHAR})")
    public void create(Comment co);
    
    @Delete( "delete comments where comm_num=#{commNum}")
	public int delete(int commNum);
}
