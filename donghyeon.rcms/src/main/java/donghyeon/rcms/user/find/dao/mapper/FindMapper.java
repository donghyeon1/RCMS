package donghyeon.rcms.user.find.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.find.domain.FindInfo;

public interface FindMapper {
	@Select("select user_name userName, user_email userEmail, user_id userId from users")
	public List<User> getUserInfos();
	
	@Select("select user_email userEmail, user_id userId from users where user_name=#{userName} and user_email=#{userEmail} ")
	public User getUserId(FindInfo fInfo);
	
	@Select("select user_email userEmail, user_pw userPw from users where user_id=#{userId} and user_email=#{userEmail2} ")
	public User getUserPw(FindInfo fInfo);
}
