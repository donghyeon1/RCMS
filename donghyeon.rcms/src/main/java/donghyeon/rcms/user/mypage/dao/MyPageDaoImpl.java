package donghyeon.rcms.user.mypage.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.dao.mapper.MyPageMapper;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Autowired private MyPageMapper userModifyMapper;

	@Override
	public boolean modifyPw(User user) {
		return userModifyMapper.modifyPw(user)>=1;
	}
	
	@Override
	public boolean modifyEmail(User user){
		return userModifyMapper.modifyEmail(user)>=1;
	}
	
	@Override
	public boolean modifyHp(User user){
		return userModifyMapper.modifyHp(user)>=1;
	}

}
