package donghyeon.rcms.review.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.review.domain.Search;

public interface ReviewMapper {
	@Select("select rev_num revNum, rev_title revTitle, rev_regdate  revRegDate, user_id userId from reviews order by rev_num desc")
	public List<Review> listAll();
	
	@Insert("insert into reviews "
			+ "values (review_seq.NEXTVAL, "
			+ "#{revTitle,jdbcType=VARCHAR}, "
			+ "#{revContent,jdbcType=VARCHAR}, "
			+ "sysdate, "
			+ "#{userId,jdbcType=VARCHAR})")
	public void create(Review rv);	
	
	@Update("update reviews set rev_title=#{revTitle},rev_content=#{revContent} ,rev_regdate=sysdate where rev_num=#{revNum}")
	public void update(Review rv);
	
	@Delete( "delete reviews where rev_num=#{revNum}")
	public int delete(int revNum);
	
	@Select("select rev_num revNum, rev_title revTitle, rev_content revContent, rev_regdate revRegDate, user_id userId  from reviews where rev_Num = #{revNum}")
	public Review read(int revNum);
	
	@Select("SELECT COUNT(*) FROM reviews")
	public int countArticle(String searchOption, String keyword);
	
	@Select("select rev_num revNum, rev_title revTitle"
			+ ", rev_regdate  revRegDate, user_id userId "
			+ " from reviews"
			+ " where rev_title like '%'||#{keyword}||'%' "
			+ " order by rev_num")
	public List<Review> searchReviewTitle(Search search);
	
	@Select("select rev_num revNum, rev_title revTitle"
			+ ", rev_regdate  revRegDate, user_id userId "
			+ " from reviews"
			+ " where rev_content like '%'||#{keyword}||'%' "
			+ " order by rev_num")
	public List<Review> searchReviewContent(Search search);
	
	@Select("select rev_num revNum, rev_title revTitle"
			+ ", rev_regdate  revRegDate, user_id userId "
			+ " from reviews"
			+ " where user_id like '%'||#{keyword}||'%' "
			+ " order by rev_num")
	public List<Review> searchReviewUserId(Search search);
	
	@Select("select rev_num revNum, rev_title revTitle, rev_regdate  revRegDate, user_id userId from ("
			+ "  select rownum as rnum , x.* from("
			+ "    select * from reviews    order by rev_num desc  "
			+ " )x where rownum <=#{rowCnt}*#{currentPage}"
			+ ")where rnum > #{rowCnt}*(#{currentPage}-1)")
	public List<Review> getReviews(Page page);
}
