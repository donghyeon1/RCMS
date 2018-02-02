package donghyeon.rcms.user.join.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import donghyeon.rcms.common.domain.User;

public interface JoinMapper {
	@Insert("insert into users values(#{userId,jdbcType=VARCHAR},"
			+"#{userName,jdbcType=VARCHAR},#{userPw,jdbcType=VARCHAR},"
			+"#{userEmail,jdbcType=VARCHAR},#{userHp,jdbcType=VARCHAR},1)")
	public int addUser(User user);
	
	@Select("select user_id userId from users")
	public List<String> getUserIds();
}
