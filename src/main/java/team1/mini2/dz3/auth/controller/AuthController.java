package team1.mini2.dz3.auth.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseCookie;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import team1.mini2.dz3.auth.core.AuthService;
import team1.mini2.dz3.auth.core.ExpireProperties;
import team1.mini2.dz3.auth.model.BasicResultDto;
import team1.mini2.dz3.auth.model.AuthDto;
import team1.mini2.dz3.auth.model.EmailCodeDto;
import team1.mini2.dz3.auth.model.EmailValidDto;
import team1.mini2.dz3.auth.model.JwtDto;
import team1.mini2.dz3.auth.model.SignUpDto;
import team1.mini2.dz3.auth.model.SignUpResultDto;
import team1.mini2.dz3.auth.model.ValidDto;

@RestController
@Validated
public class AuthController {

	@Autowired
	private AuthService authService;

	@PostMapping("/login")
	public BasicResultDto login(@Valid @RequestBody(required=true) AuthDto authDto, HttpServletRequest request,
			HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
		JwtDto dto = authService.login(authDto);
		if(dto.getResult()==JwtDto.SUCCESS) {
			Map<String, String> resultMap = new HashMap<>();
			resultMap.put("accessToken", dto.getAccessToken());
			resultMap.put("refreshToken", dto.getRefreshToken());
			ResponseCookie cookie = ResponseCookie.from("jwtToken", URLEncoder.encode(new ObjectMapper().writeValueAsString(resultMap), "UTF-8"))
					.maxAge(ExpireProperties.REFRESH_EXPIRE_MIN)
					.path(request.getContextPath())
					.secure(true)
					.sameSite("None")
					.httpOnly(true)
					.build();
			response.setHeader("Set-Cookie", cookie.toString());
			return new BasicResultDto(true);
		}
		return new BasicResultDto(false);
	}

	@PostMapping("/signup")
	public SignUpResultDto SignUp(@Valid @RequestBody(required=true) SignUpDto signUpDto) {
		return authService.signUp(signUpDto);
	}

	@GetMapping("/valid/email")
	public EmailValidDto validEmail( 
			@NotBlank @Email @RequestParam(required=true) String authEmail) {
		return authService.validEmail(authEmail);
	}

	@GetMapping("/valid/id")
	public ValidDto validId(@NotBlank @RequestParam(required=true) String authId) {
		return authService.validId(authId);
	}

	@PostMapping("/valid/pwd")
	public ValidDto validPwd(@RequestBody(required=true) HashMap<String, String> map) {
		return authService.validPwd(map.get("authPwd"));
	}

	@PostMapping("valid/code")
	public ValidDto validCode(@Valid @RequestBody(required=true) EmailCodeDto dto) {
		return authService.validCode(dto);
	}
	
	@GetMapping("/reissue")
	public BasicResultDto reissue(HttpServletRequest request,
			HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
		Cookie[] cookies = request.getCookies();
		if(cookies==null) {
			return new BasicResultDto(false);
		}
		String refreshToken = null;
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("jwtToken")) {
				Map<String, String> map = new ObjectMapper().readValue(URLDecoder.decode(cookies[i].getValue(), "UTF-8"), HashMap.class);
				refreshToken = map.get("refreshToken"); 
			}
		}
		if(refreshToken==null) {
			return new BasicResultDto(false);
		}
		JwtDto dto = authService.reissue(refreshToken);
		if(dto.getResult()==JwtDto.SUCCESS) {
			Map<String, String> resultMap = new HashMap<>();
			resultMap.put("accessToken", dto.getAccessToken());
			resultMap.put("refreshToken", dto.getRefreshToken());
			ResponseCookie cookie = ResponseCookie.from("jwtToken", URLEncoder.encode(new ObjectMapper().writeValueAsString(resultMap), "UTF-8"))
					.maxAge(ExpireProperties.REFRESH_EXPIRE_MIN)
					.path(request.getContextPath())
					.secure(true)
					.sameSite("None")
					.httpOnly(true)
					.build();
			response.setHeader("Set-Cookie", cookie.toString());
			return new BasicResultDto(true);
		}
		return new BasicResultDto(false);
	}
}