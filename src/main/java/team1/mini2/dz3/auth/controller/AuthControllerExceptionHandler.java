package team1.mini2.dz3.auth.controller;


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

import team1.mini2.dz3.auth.core.AuthException;


@RestControllerAdvice
public class AuthControllerExceptionHandler {


	@ExceptionHandler({MethodArgumentNotValidException.class, ConstraintViolationException.class, org.springframework.validation.BindException.class})
	@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
	public ResponseEntity<String> handleArgumentNotValidException(Exception e){
		Logger.getLogger(this.getClass().getName()).log(Level.INFO, e.getLocalizedMessage());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("applicatoin/json;charset=utf-8"));
		return ResponseEntity.unprocessableEntity().header("content-type","application/json; content-type=utf-8")
				.body("{ \"exception\":\""+e.getClass().getSimpleName()+"\","
						+ "\"errorMessage\" : \""+e.getLocalizedMessage()+"\"}"
						+"\"comment\":\"요청에 포한된 파라미터 혹은 페이로드의 값이 형식에 안맞을 가능성이 높습니다.\"");
	}

	@ExceptionHandler(AuthException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ResponseEntity<String> handleAuthException(Exception e){
		Logger.getLogger(this.getClass().getName()).log(Level.INFO, e.getLocalizedMessage());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("applicatoin/json;charset=utf-8"));
		return ResponseEntity.unprocessableEntity().header("content-type","application/json; content-type=utf-8")
				.body("{ \"exception\":\""+e.getClass().getSimpleName()+"\","
						+ "\"errorMessage\" : \""+e.getLocalizedMessage()+"\"}"
						+"\"comment\":\"만료된 토큰을 사용했을 수 있습니다.\"");
	}

	@ExceptionHandler(org.springframework.web.bind.MissingServletRequestParameterException.class)
	@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
	public ResponseEntity<String> hendleBindException(Exception e){
		Logger.getLogger(this.getClass().getName()).log(Level.INFO, e.getLocalizedMessage());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("applicatoin/json;charset=utf-8"));
		return ResponseEntity.unprocessableEntity().header("content-type","application/json; content-type=utf-8")
				.body("{ \"exception\":\""+e.getClass().getSimpleName()+"\","
						+ "\"errorMessage\" : \""+e.getLocalizedMessage()+"\"}"
						+"\"comment\":\"요청에 포한된 파라미터 혹은 페이로드가 잘못 구성되어 있을 가능성이 높습니다.\"");
	}

	@ExceptionHandler(com.auth0.jwt.exceptions.JWTDecodeException.class)
	@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
	public ResponseEntity<String> hendleJwtException(Exception e){
		Logger.getLogger(this.getClass().getName()).log(Level.INFO, e.getLocalizedMessage());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("applicatoin/json;charset=utf-8"));
		return ResponseEntity.unprocessableEntity().header("content-type","application/json; content-type=utf-8")
				.body("{ \"exception\":\""+e.getClass().getSimpleName()+"\","
						+ "\"errorMessage\" : \""+e.getLocalizedMessage()+"\"}"
						+"\"comment\":\"JWT양식에 맞지 않는 입력 값을 요청했습니다.\"");
	}
	
	@ExceptionHandler(com.auth0.jwt.exceptions.TokenExpiredException.class)
	@ResponseStatus(HttpStatus.UNPROCESSABLE_ENTITY)
	public ResponseEntity<String> hendleJwtExpiredException(Exception e){
		Logger.getLogger(this.getClass().getName()).log(Level.INFO, e.getLocalizedMessage());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType("applicatoin/json;charset=utf-8"));
		return ResponseEntity.unprocessableEntity().header("content-type","application/json; content-type=utf-8")
				.body("{ \"exception\":\""+e.getClass().getSimpleName()+"\","
						+ "\"errorMessage\" : \""+e.getLocalizedMessage()+"\"}"
						+"\"comment\":\"만료된 토큰 요청\"");
	}
}