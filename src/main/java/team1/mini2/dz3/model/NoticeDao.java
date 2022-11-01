package team1.mini2.dz3.model;

import java.util.Map;
import java.util.List;

public interface NoticeDao {
	List<NoticeDto> getList(Map<String, Integer> map);
	NoticeDto get(int noticeNo);
	int getCount();
	void add(Map<String, String> map);
	void remove(int noticeNo);
	void set(Map<String, String> map);
}
