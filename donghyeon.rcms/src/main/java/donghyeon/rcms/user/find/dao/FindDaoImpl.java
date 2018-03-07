package donghyeon.rcms.user.find.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.find.dao.mapper.FindMapper;
import donghyeon.rcms.user.find.domain.FindInfo;

@Repository
public class FindDaoImpl implements FindDao{
	@Autowired private FindMapper findMapper;
	
	public List<User> getUserInfos(){
		return findMapper.getUserInfos();
	}
	
	public User getUserId(FindInfo fInfo){
		return findMapper.getUserId(fInfo);
	}
	
	public User getUserPw(FindInfo fInfo){
		return findMapper.getUserPw(fInfo);
	}
}
