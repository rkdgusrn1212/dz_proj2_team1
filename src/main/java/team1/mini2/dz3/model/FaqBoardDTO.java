package team1.mini2.dz3.model;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FaqBoardDTO {   // model

	private int NOTICE_NO;
	private String NOTICE_TITLE, NOTICE_CONTENT;
	private Date NOTICE_REGDATE;
	
	public FaqBoardDTO(int NOTICE_NO,String NOTICE_TITLE, String NOTICE_CONTENT) {
		super();
		this.NOTICE_NO = NOTICE_NO;
		this.NOTICE_TITLE = NOTICE_TITLE;
		this.NOTICE_CONTENT = NOTICE_CONTENT;
		
	}
}



