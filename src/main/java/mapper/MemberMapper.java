package mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import com.damoim.model.dto.MemberListDTO;
import com.damoim.model.vo.Member;

@Mapper
public interface MemberMapper {
	
	Member login(String id);
	
	ArrayList<MemberListDTO> loginMemberMembership(Member member); 
	
	
	
	void signUp(Member member);
	
	Member idCheck(Member member);
	Member nicknameCheck(Member member);
	Member pwdCheck(Member member);	
	Member memberInfo(Member member);
	String grade(Member member);
	
	// 업데이트 ===============================
	void updateMember(Member member);
	void memberDelete(Member member);
	
	
	Member updateCheck(Member vo, Member mem);
	void updateMemberInfo(Member member);
	void addrUpdate(Member member);
	boolean nicknameDupCheck(Member vo);
	void fileDelete(String string);
	Member selectImg(String string);
	
	// id 이메일 맞나 체크
	Member memberEmailIdcheck(Member member);
	
	// 업데이트
	void updatePassword(Member member);
	// 아래 2개 더미 비밀번호 암호화용도
	ArrayList<Member> dummyMember();
	void dummyUpdate(Member member);

}

// 회원가입에 필요한  Mapper

//void register(SignUp signup);
//List<SignUp> allMember();
//SignUp login(SignUp signup);
//void update(SignUp signup);




//locationCategoryLarg; // 위치 대분류
//
//locationCategorySmall; // 위치 소분류

//membershipType; // 클럽 유형 리스트
//
//membershipLocation; // 클럽 지역 리스트
//
//membershipUserList; // 클럽유저정보
//
//channel; // 클럽채널
//
//membershipMeetings; // 클럽모임게시판
//
//meetingsAgree; // 클럽 모임게시판 - 클럽 회원 리스트 참여여부 테이블 
//
//meetingsComment; // 클럽 모임 게시판에 댓글기능 추가
//
//main; // 클럽홍보게시판
//
//mainComment; // 매인 게시판에 댓글기능 추가

