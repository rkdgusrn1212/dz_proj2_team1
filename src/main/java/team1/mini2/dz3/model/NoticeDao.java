package team1.mini2.dz3.model;

import java.util.HashMap;
import java.util.List;

public interface NoticeDao {
	List<NoticeDto> getList(HashMap<String, Integer> map);
	int getCount();
}
