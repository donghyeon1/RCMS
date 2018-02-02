package donghyeon.rcms.user.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.login.dao.LoginDao;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired private LoginDao loginDao;
	
	public User getUser(String userId,String userPw){
		User user=loginDao.getUser(userId);
		if(user!=null && userId.equals(user.getUserId())){
			if(userPw.equals(user.getUserPw())){
				return user;
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
}
