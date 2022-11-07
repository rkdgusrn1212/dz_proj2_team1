package team1.mini2.dz3.controller.api;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import team1.mini2.dz3.controller.api.exception.NotMatchMapException;

@RestControllerAdvice
public class ApiControllerExceptionHandler {
	
	@ExceptionHandler(NotMatchMapException.class)
	public ResponseEntity<String> handleNotMatchMap() {
		Logger.getLogger(this.getClass().getName()).log(Level.INFO, "NotMatchMapException 발생");
		  HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.parseMediaType("applicatoin/json;content-type=utf-8"));
		return ResponseEntity.unprocessableEntity().header("content-type","application/json; content-type=utf-8")
				.body("{ \"exception\":\""+NotMatchMapException.class.getSimpleName()+"\","
						+ "\"errorMessage\" : \"파라미터가 부족하거나 틀린 파라미터가 들어있습니다.\"}");
	}
}