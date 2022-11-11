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
import team1.mini2.dz3.auth.model.SignUpDto;
import team1.mini2.dz3.auth.model.SignUpResultDto;
import team1.mini2.dz3.auth.model.ValidDto;


@Validated
public interface AuthService {
	JwtDto login(@Valid AuthDto UserVoDto) ;
	JwtDto reissue(@NotBlank String bearerToken);
	ValidDto validId(@NotBlank String authId);
	EmailValidDto validEmail(@NotNull @Email String authEmail);
	ValidDto validPwd(@NotBlank String authPwd);
	ValidDto validCode(@NotNull @Valid EmailCodeDto emailCodeDto);
	SignUpResultDto signUp(@NotNull @Valid SignUpDto signUpDto);
}