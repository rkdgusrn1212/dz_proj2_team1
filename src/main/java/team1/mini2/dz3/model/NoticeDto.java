package team1.mini2.dz3.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegDate;
}
