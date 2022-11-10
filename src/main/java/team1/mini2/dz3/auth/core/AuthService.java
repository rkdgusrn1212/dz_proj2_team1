package team1.mini2.dz3.auth.core;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import org.springframework.validation.annotation.Validated;

import team1.mini2.dz3.auth.model.AuthDto;
import team1.mini2.dz3.auth.model.JwtDto;


@Validated
public interface AuthService {
	JwtDto login(@Valid AuthDto UserVoDto) ;

	JwtDto reissue(@NotBlank String bearerToken);
}