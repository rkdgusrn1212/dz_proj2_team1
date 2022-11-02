package team1.mini2.dz3.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.*;

public interface NoticeDao {

	public NoticeDto noticegetdetail(int faq_no);
	public List<NoticeDto> noticegetBoardList(HashMap map);
	public int noticegetBoardCount();
	public int noticeselectSearchCount(HashMap map);
	public List<NoticeDto> noticegetselectSearch(HashMap map);
	
}//end
