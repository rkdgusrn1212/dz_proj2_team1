package team1.mini2.dz3.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.*;

public interface FaqBoardDAO {

	public FaqBoardDTO getdetail(int notice_no);
	public List<FaqBoardDTO> getBoardList(HashMap map);
	public int getBoardCount();
	public int selectSearchCount();
	public List<FaqBoardDTO> getselectSearch(HashMap map);
	
}//end
