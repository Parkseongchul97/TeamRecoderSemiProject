package mapper;

import java.util.ArrayList;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.damoim.model.dto.MemberListDTO;
import com.damoim.model.vo.BasicRoomListVo;
import com.damoim.model.vo.Member;
import com.damoim.model.vo.Membership;

import com.damoim.model.vo.MembershipType;
import com.damoim.model.vo.MembershipUserList;
import com.damoim.model.vo.Paging;
import com.damoim.model.vo.TypeCategory;

@Mapper
public interface MembershipMapper {
	
	
	MembershipUserList main(int membershipCode);
	int membershipUserCount(int membershipCode);
	void membershipApply(MemberListDTO member);
	List<MembershipUserList>allMembership(Paging paging);
	MemberListDTO checkMember(MemberListDTO member);
	void makeMembership(Membership membership);
	void host(MemberListDTO list);
//	void createclub(Membership membership);
//	void searchMembershipInfo(Membership membership );
	List<MembershipUserList> MembershipAllInfo(int membershipCode);
	List<MemberListDTO> grade(Member member);
	List<MembershipUserList>allMembership();
	ArrayList<Member> allMember();
//	void createclub2(Membership membership);
	List<MembershipUserList> listGrade(Member member);
	
	void agreeMemeber(MemberListDTO member);
	
	 
	List<Integer> membershipCodeList(String id);
	List<BasicRoomListVo> roomlist();
	
	void membershipImg(Membership membership);
	
	
	
	void updateMembership(Membership membership);
	
	
}










