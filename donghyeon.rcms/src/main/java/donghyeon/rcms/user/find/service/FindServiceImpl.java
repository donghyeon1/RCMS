package donghyeon.rcms.user.find.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.find.dao.FindDao;
import donghyeon.rcms.user.find.domain.FindInfo;

@Service
public class FindServiceImpl implements FindService{
	@Autowired FindDao findDao;
	
	//이름과 이메일이 같으면
	public User idCheck(FindInfo fInfo){
//		List<User> users=findDao.getUserInfos();
		System.out.println(findDao.getUserInfos());
		for(User user:findDao.getUserInfos()){
			if (user.getUserName().equals(fInfo.getUserName()) && user.getUserEmail().equals(fInfo.getUserEmail()) ){
				return user;
			}
		}
		return null;
	}
	
	//아이디와 이메일이 같으면 
	public User pwCheck(FindInfo fInfo){
		List<User> users=findDao.getUserInfos();
		for(User user:users){
			if (user.getUserId().equals(fInfo.getUserId()) && user.getUserEmail().equals(fInfo.getUserEmail()) ){
				return user;
			}
		}
		return null;
	}
}
