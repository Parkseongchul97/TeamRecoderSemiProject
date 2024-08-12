package mapper;

import java.util.List;
import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.damoim.model.dto.SearchDTO;

import org.apache.ibatis.annotations.Mapper;

import com.damoim.model.dto.MemberListDTO;
import com.damoim.model.vo.Member;



@Mapper
public interface MemberMapper {
	
	Member login(Member member);
	ArrayList<MemberListDTO> loginMemberMembership(Member member);
	void signUp(Member member);
	Member idCheck(Member member);
	Member nicknameCheck(Member member);
	Member pwdCheck(Member member);	
	void update(Member member);
	Member memberInfo(Member member);
	String grade(Member member);
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

