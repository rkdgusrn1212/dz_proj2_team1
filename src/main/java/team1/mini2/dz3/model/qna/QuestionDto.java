package team1.mini2.dz3.model.qna;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class QuestionDto{
	@NotBlank
	@Size(max=60)
	String qnaTitle;
	@NotBlank
	@Size(max=1000)
	String qnaContent;
	@NotBlank
	@Pattern(regexp = "[TF]")
	String qnaPublic;
}