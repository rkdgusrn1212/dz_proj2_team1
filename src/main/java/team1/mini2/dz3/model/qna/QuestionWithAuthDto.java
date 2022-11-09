package team1.mini2.dz3.model.qna;

import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class QuestionWithAuthDto extends QuestionDto {
	@Size(min=1)
	private int qnaWriter;
}