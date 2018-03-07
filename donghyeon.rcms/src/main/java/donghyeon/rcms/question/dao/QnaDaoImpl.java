package donghyeon.rcms.question.dao;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Question;
import donghyeon.rcms.question.dao.mapper.QnaMapper;
import donghyeon.rcms.question.domain.Qsearch;


@Repository
public class QnaDaoImpl implements QnaDao{
	@Autowired private QnaMapper qnaMapper;
	
	public List<Question> getQuestions(Page page){
		return qnaMapper.getQuestions(page);
	}
	
	//게시판 목록
	public List<Question>getUsers(){
		return qnaMapper.getUsers();
	}
	
	//게시판 추가
	public int create(Question qa){
		return qnaMapper.create(qa);
	}
	
	//글상세보기
	public Question writeInfo(int qstNum){
		return qnaMapper.writeInfo(qstNum);
	}
	
	//수정
	public void update(Question qa){
		qnaMapper.update(qa);
	}
	
	//삭제
	public int delete(int qstNum){
		return qnaMapper.delete(qstNum);
	}

	@Override
	public int writeGetCount() {
		return qnaMapper.writeGetCount();
		
	}
	
	public int updateAnswer(Question qst){
		return qnaMapper.updateAnswer(qst);
	}
	
	//검색
	@Override
	public List<Question> searchQuestion(Qsearch qsearch) {
		switch(qsearch.getQsearchOption()){
		case "qst_Title": return qnaMapper.searchQnaTitle(qsearch);
		case "qst_Content": return qnaMapper.searchQnaContent(qsearch);
		case "user_Id": return qnaMapper.searchQnaUserId(qsearch);
		default: return null;
		}
	}

}
