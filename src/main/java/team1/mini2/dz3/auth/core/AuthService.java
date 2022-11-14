package team1.mini2.dz3.auth.core;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import org.springframework.validation.annotation.Validated;

import team1.mini2.dz3.auth.model.AuthDto;
import team1.mini2.dz3.auth.model.EmailCodeDto;
import team1.mini2.dz3.auth.model.EmailValidDto;
import team1.mini2.dz3.auth.model.JwtDto;
import team1.mini2.dz3.auth.model.PutRefreshTokenDto;
import team1.mini2.dz3.auth.model.SignUpDto;
import team1.mini2.dz3.auth.model.SignUpResultDto;
import team1.mini2.dz3.auth.model.ValidDto;


@Validated
public interface AuthService {
	/**
	 * 로그인 및 토큰 반환.
	 * @param authDto
	 * @return 토큰들 생성 반환하고, 패스워드 미일치 : PWD_ERROR, 유저 없음 : USER_ERROR 가능함.
	 */
	JwtDto login(@Valid AuthDto authDto) ;
	JwtDto reissue(@NotBlank String refreshToken);
	ValidDto validId(@NotBlank String authId);
	EmailValidDto validEmail(@NotNull @Email String authEmail);
	ValidDto validPwd(@NotBlank String authPwd);
	ValidDto validCode(@NotNull @Valid EmailCodeDto emailCodeDto);
	SignUpResultDto signUp(@NotNull @Valid SignUpDto signUpDto);
}