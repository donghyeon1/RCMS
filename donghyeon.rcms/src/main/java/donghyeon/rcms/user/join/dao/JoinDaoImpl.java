package donghyeon.rcms.user.join.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.join.dao.mapper.JoinMapper;

@Repository
public class JoinDaoImpl implements JoinDao{
	@Autowired private JoinMapper joinMapper;
	
	public boolean addUser(User user){
		return (joinMapper.addUser(user)>=1);
	}
	
	public List<String> getUserIds(){
		return joinMapper.getUserIds();
	}
}
