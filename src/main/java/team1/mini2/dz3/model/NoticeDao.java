package team1.mini2.dz3.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
public interface NoticeDao {
	
	List<NoticeDto> getList(Map<String, String> map);
	List<NoticeDto> getListWithTitle(Map<String, String> map);
	List<NoticeDto> getListWithContent(Map<String, String> map);
	List<NoticeDto> getListWithRegDate(Map<String, String> map);
	List<NoticeDto> getListWithWriter(Map<String, String> map);

	NoticeDto get(int noticeNo);
	int getCount();
	void add(Map<String, String> map);
	void remove(int noticeNo);
	void set(Map<String, String> map);
}
