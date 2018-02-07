package donghyeon.rcms.user.mypage.dao.mapper;


import org.apache.ibatis.annotations.Update;

import donghyeon.rcms.common.domain.User;

public interface MyPageMapper {	
	@Update("update users set user_pw=#{userPw} where user_id=#{userId}")
	int modifyPw(User user);
	
	@Update("update users set user_email=#{userEmail} where user_id=#{userId}")
	int modifyEmail(User user);
	
	@Update("update users set user_hp=#{userHp} where user_id=#{userId}")
	int modifyHp(User user);
}
