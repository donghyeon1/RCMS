package donghyeon.rcms.user.login.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.login.dao.mapper.LoginMapper;

@Repository
public class LoginDaoImpl implements LoginDao{
	@Autowired private LoginMapper loginMapper;
	
	public User getUser(String userId){
		return loginMapper.getUser(userId);
	}
}
