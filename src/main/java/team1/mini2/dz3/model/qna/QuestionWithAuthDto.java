package team1.mini2.dz3.model.qna;

import javax.validation.constraints.Min;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class QuestionWithAuthDto extends QuestionDto {
	@Min(0)
	private int qnaWriter;
}