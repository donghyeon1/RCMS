package donghyeon.rcms.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Question;
import donghyeon.rcms.question.dao.QnaDao;
import donghyeon.rcms.question.domain.Qsearch;

@Service
public class QnaServiceImpl implements QnaService{
	

	@Autowired private QnaDao qnaDao;
	
	@Override
	public List<Question> getQuestions(Page page){
		return qnaDao.getQuestions(page);
	}

	@Override
	public List<Question> qnalists() {
		return qnaDao.getUsers();
	}
	
	@Override
	public int creates(Question qa){
		return qnaDao.create(qa);
	}

	@Override
	public Question writeInfo(int qstNum) {
		return qnaDao.writeInfo(qstNum);
	}
	
	@Transactional
	public void fixupdate(Question qa){
		 qnaDao.update(qa);
	}
	
	@Transactional
	public boolean secede(int qstNum){
		return qnaDao.delete(qstNum)>0;
	}
	
	public int writeGetCount(){
		return qnaDao.writeGetCount();
	}
	
	public int updateAnswer(Question qst){
		return qnaDao.updateAnswer(qst);
	}
	
	//검색
	@Override
	public List<Question> searchQuestion(Qsearch qsearch) {
		System.out.println(qnaDao.searchQuestion(qsearch));
		return qnaDao.searchQuestion(qsearch);
	}

}
