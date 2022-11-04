package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.NoticeDto;

public interface NoticeService {
	List<NoticeDto> getNoticePage(int page);
	List<NoticeDto> getNoticePageWithTitle(int page, String key);
	List<NoticeDto> getNoticePageWithContent(int page, String key);
	List<NoticeDto> getNoticePageWithRegDate(int page, String key);
	int getNoticePageWithTitleCount(String key);
	int getNoticePageWithContentCount(String key);
	int getNoticePageWithRegDateCount(String key);
	int getNoticeWithTitleCount(String key);
	int getNoticeWithContentCount(String key);
	int getNoticeWithRegDateCount(String key);
	NoticeDto getNotice(int noticeNo);
	void addNotice(Map<String, String> map);
	void removeNotice(int noticeNo);
	void setNotice(Map<String, String> map);
	int getNoticeCount();
	int getNoticePageCount();
}
