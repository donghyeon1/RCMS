package donghyeon.rcms.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.review.dao.ReviewDao;
import donghyeon.rcms.review.domain.Search;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired ReviewDao reviewDao;

	@Override
	public List<Review> listAll()  {
		return reviewDao.listAll();
	}

	@Override
	public void create(Review rv)  {
		reviewDao.create(rv);	
	}

	@Override
	public void update(Review rv)  {
		reviewDao.update(rv);
		
	}

	@Override
	public int delete(int revNum) {
		return reviewDao.delete(revNum);
	}

	@Override
	public Review read(int revNum) {
		return reviewDao.read(revNum);
	}

	//검색
	public List<Review> searchReview(Search search){
		return reviewDao.searchReview(search);
	}
	
	public List<Review> getReviews(Page page){
		return reviewDao.getReviews(page);
	}
}
