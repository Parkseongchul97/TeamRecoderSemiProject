package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.damoim.model.vo.Membership;

@Mapper
public interface MembershipMapper {

	void createclub(Membership membership);
	List<Membership> allClub();
}
