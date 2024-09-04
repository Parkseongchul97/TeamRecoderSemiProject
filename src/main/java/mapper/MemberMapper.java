package mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.damoim.model.dto.SearchDTO;

import org.apache.ibatis.annotations.Mapper;

import com.damoim.model.dto.MemberInfoDTO;
import com.damoim.model.dto.MemberListDTO;
import com.damoim.model.dto.MemberMannerDTO;
import com.damoim.model.vo.Member;

@Mapper
public interface MemberMapper {
	
	// 로그인 관련 ===========================================
	Member login(String id); // 로그인 	
	
	ArrayList<MemberListDTO> loginMemberMembership(Member member); 
	
	
	// 회원가입 + 다양한 재사용 가능 쿼리 ==========================================
	void signUp(Member member); // 회원가입 
	
	Member idCheck(Member member); // 회원가입시 ID 확인 + 각종 ID로 회원정보
	Member nicknameCheck(Member member); // 회원가입시 닉네임 확인
	Member emailCheck(Member member); // 회원가입시 이메일 확인
	Member memberInfo(Member member); // 회원 정보 수정때 사용하는거 같은데 확인 중복임 !!!
	
	// 회원정보 업데이트 ===============================
	void updateMember(Member vo); // 회원정보(중요)업데이트
	void updateMemberInfo(Member member); // 회원정보(비중요) 업데이트
	
	// 회원탈퇴 ======================================
	boolean memberStatus(Member member); // 회원 탈퇴시 해당 회원의 스테이터스를 false로 변경
	void memberActBlock(MemberInfoDTO dto); //  XML에 존재 X 사용처 ? ?????????????
	Member membershipSelect(Member member); //XML에 존재 X 사용처 ? ?????????????
	
	
	// 아이디 , 비밀번호 찾기 ===================================
	Member findMemberId(Member member); // 회원 ID 찾기 이름, 이메일로
	
	Member memberEmailIdcheck(Member member); // ID와 이메일 맞게 넣으면 이메일로 임시비밀번호 발송
	void updatePassword(Member member); // 임시 비밀번호로 변경
	
	// 회원 추천기능 ==========================================
	void memberManner(MemberMannerDTO dto);
	void updateLastRecommendationTime(String id);
	
	// 아래 2개 더미 비밀번호 암호화용도 ========================
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

