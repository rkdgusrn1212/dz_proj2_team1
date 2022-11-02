package team1.mini2.dz3.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NoticeDTO {   // model

	private int notice_no;
	private String notice_title, notice_writer, notice_content;
	private Date notice_regdate;
	
	public NoticeDTO(int noticeNo, String noticeTitle, String noticeWriter, Date noticeRegdate) {
		super();
		this.notice_no = noticeNo;
		this.notice_content = noticeTitle;
		this.notice_writer = noticeWriter;
		this.notice_regdate = noticeRegdate;
	}
}


