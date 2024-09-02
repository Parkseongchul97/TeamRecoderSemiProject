package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.damoim.model.vo.MeetingsAgree;
import com.damoim.model.vo.MembershipMeetings;
import com.damoim.model.vo.Image;

@Mapper
public interface MembershipMeetingMapper {

	
	void addMeeting(MembershipMeetings meetings) ;
	
	List<MembershipMeetings> allMeetings(int membershipCode);
	
	MembershipMeetings meetSelect(int meetCode);
	
	void yesOrNo(MeetingsAgree ma);
	
	List<MeetingsAgree> meetMember (int meetCode);
	
	void participation(MeetingsAgree ma);
	
	public void addImage (Image img);
	
	List<Image> viewImage (int meetCode);
	
	// 미팅 삭제 
	void meetingDelete(int meetCode);
	
}
