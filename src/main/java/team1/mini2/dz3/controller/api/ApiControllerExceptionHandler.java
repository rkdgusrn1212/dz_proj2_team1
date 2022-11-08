package team1.mini2.dz3.controller.api;


import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.ConstraintViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@RestControllerAdvice
public class ApiControllerExceptionHandler {
	
	
	@ExceptionHandler({MethodArgumentNotValidException.class, ConstraintViolationException.class, org.springframework.validation.BindException.class})
	@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
	public ResponseEntity<String> handleArgumentNotValid(Exception e){
		Logger.getLogger(this.getClass().getName()).log(Level.INFO, e.getLocalizedMessage());
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.parseMediaType("applicatoin/json;content-type=utf-8"));
	return ResponseEntity.unprocessableEntity().header("content-type","application/json; content-type=utf-8")
			.body("{ \"exception\":\""+e.getClass().getSimpleName()+"\","
					+ "\"errorMessage\" : \""+e.getMessage()+"\"}");
	}
}