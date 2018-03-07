package donghyeon.rcms.question.dao.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Question;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.question.domain.Qsearch;
import donghyeon.rcms.review.domain.Search;


public interface QnaMapper {
	
	@Select("select qst_num qstNum, qst_title qstTitle, qst_content  qstContent, qst_answer qnaAnswer, qst_regdate QstRegDate, user_id userId, qst_status qstStatus from ("
			+ "  select rownum as rnum , x.* from("
			+ "    select * from questions    order by qst_num desc  "
			+ " )x where rownum <=#{rowCnt}*#{currentPage}"
			+ ")where rnum > #{rowCnt}*(#{currentPage}-1)")
	public List<Question> getQuestions(Page page);
	
	@Select("select qst_num qstNum, qst_title qstTitle, qst_status qstStatus, qst_regdate qstRegDate, user_id userId from questions order by qst_num desc")
	List<Question> getUsers();
	
	/*@Select("select qst_num qstNum, qst_title qstTitle, qst_status qstStatus, qst_regdate qstRegDate, user_id userId from questions order by qst_num desc")
	List<Question> getUsers(int offset,int noOfRecords);
*/	
	public int writeGetCount();
	
	@Insert("insert into questions (qst_num, qst_title, qst_content, user_id)"
	         + "values (QUESTIONS_SEQ.NEXTVAL,"
			 + "#{qstTitle,jdbcType=VARCHAR}, "
	         + "#{qstContent,jdbcType=VARCHAR}, "
	         + "#{userId,jdbcType=VARCHAR})")
	public int create(Question qa);
	
	@Select("select qst_num qstNum, qst_title qstTitle, qst_content qstContent, qst_answer qstAnswer, qst_status qstStatus, qst_regdate qstRegDate, user_id userId  from questions where qst_num=#{qstNum} order by qst_num desc")
	public Question writeInfo(int qstNum);
	
	@Update("update questions set qst_title=#{qstTitle},qst_content=#{qstContent},qst_regdate=sysdate where qst_num=#{qstNum}")
	public void update(Question qa);
	
	@Delete("delete questions where qst_num = #{qstNum}")
	public int delete(int qstNum);
	
	@Update("update questions set qst_answer=#{qstAnswer},qst_status='답변완료' where qst_num=#{qstNum}")
	public int updateAnswer(Question qst);
	
	
	
	
	
	
	@Select("select qst_num qstNum, qst_title qstTitle"
			+ ", qst_regdate  qstRegDate, user_id userId, qst_status qstStatus "
			+ " from questions"
			+ " where qst_title like '%'||#{qkeyword}||'%' "
			+ " order by qst_num")
	public List<Question> searchQnaTitle(Qsearch qsearch);
	
	@Select("select qst_num qstNum, qst_title qstTitle"
			+ ", qst_regdate  qstRegDate, user_id userId, qst_status qstStatus"
			+ " from questions"
			+ " where qst_content like '%'||#{qkeyword}||'%' "
			+ " order by qst_num")
	public List<Question> searchQnaContent(Qsearch qsearch);
	
	@Select("select qst_num qstNum, qst_title qstTitle"
			+ ", qst_regdate  qstRegDate, user_id userId, qst_status qstStatus "
			+ " from questions"
			+ " where user_id like '%'||#{qkeyword}||'%' "
			+ " order by qst_num")
	public List<Question> searchQnaUserId(Qsearch qsearch);
}
