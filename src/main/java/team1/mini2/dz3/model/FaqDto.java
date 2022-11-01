package team1.mini2.dz3.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class FaqDto {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private Date faqRegDate;
}
