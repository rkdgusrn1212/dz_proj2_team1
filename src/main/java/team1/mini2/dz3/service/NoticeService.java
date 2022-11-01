package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.NoticeDto;

public interface NoticeService {
	List<NoticeDto> getNoticePage(int page);
	NoticeDto getNotice(int noticeNo);
	void addNotice(Map<String, String> map);
	void removeNotice(int noticeNo);
	void setNotice(Map<String, String> map);
	int getNoticeCount();
}
