package team1.mini2.dz3.model;

import java.util.Map;
import java.util.List;

public interface NoticeDao {
	List<NoticeDto> getList(Map<String, String> map);
	List<NoticeDto> getListWithTitle(Map<String, String> map);
	List<NoticeDto> getListWithContent(Map<String, String> map);
	List<NoticeDto> getListWithRegDate(Map<String, String> map);
	int getWithTitleCount(String key);
	int getWithContentCount(String key);
	int getWithRegDateCount(String key);
	NoticeDto get(int noticeNo);
	int getCount();
	void add(Map<String, String> map);
	void remove(int noticeNo);
	void set(Map<String, String> map);
}
