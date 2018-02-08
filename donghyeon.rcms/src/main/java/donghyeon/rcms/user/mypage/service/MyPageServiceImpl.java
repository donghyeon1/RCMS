package donghyeon.rcms.user.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.dao.MyPageDao;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired private MyPageDao myPageDao; 

	@Override
	public boolean modifyPw(User user) {
		return myPageDao.modifyPw(user);
	}

	@Override
	public boolean modifyEmail(User user) {
		return myPageDao.modifyEmail(user);
	}

	@Override
	public boolean modifyHp(User user) {
		return myPageDao.modifyHp(user);
	}
	
	@Override
	public boolean secedeUser(String userId){
		return myPageDao.secedeUser(userId);
	}

}
