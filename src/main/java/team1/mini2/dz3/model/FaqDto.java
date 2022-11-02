package team1.mini2.dz3.model;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FaqDto {   // model

	private int FAQ_NO;
	private String FAQ_TITLE, FAQ_CONTENT;
	private Date FAQ_REGDATE;
	
	public FaqDto(int FAQ_NO,String FAQ_TITLE, String FAQ_CONTENT) {
		super();
		this.FAQ_NO = FAQ_NO;
		this.FAQ_TITLE = FAQ_TITLE;
		this.FAQ_CONTENT = FAQ_CONTENT;
		
	}
}



