package team1.mini2.dz3.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class FaqDto {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	
	private Date faqRegDate;
}
