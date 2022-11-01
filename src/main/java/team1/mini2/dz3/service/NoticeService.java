package team1.mini2.dz3.service;

import java.util.List;

import team1.mini2.dz3.model.NoticeDto;

public interface NoticeService {
	List<NoticeDto> getNoticeList(int page);
	void addNotice();
	void deleteNotice();
	void updateNotice(String title, String content);
	int getNoticeCount();
}
