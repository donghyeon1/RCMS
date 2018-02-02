package donghyeon.rcms.user.login.dao.mapper;

import org.apache.ibatis.annotations.Select;

import donghyeon.rcms.common.domain.User;

public interface LoginMapper {
	@Select("select user_id userId, user_pw userPw, "
			+ "user_name userName, user_email userEmail, user_hp userHp,"
			+ "class_code classCode from users where user_id=#{userId}")
	User getUser(String userId);
}
