package team1.mini2.dz3.model.qna;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class QuestionWithNoAuthDto extends QuestionDto{
	@NotBlank
	@Size(max=60)
	private String qnaNonMember;
	@NotBlank
	@Size(max=60)
	private String qnaPwd;
}
