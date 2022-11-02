package team1.mini2.dz3.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.*;

public interface FaqDao {

	public FaqDto faqgetdetail(int faq_no);
	public List<FaqDto> faqgetBoardList(HashMap map);
	public int faqgetBoardCount();
	public int faqselectSearchCount(HashMap map);
	public List<FaqDto> faqgetselectSearch(HashMap map);
	
}//end
