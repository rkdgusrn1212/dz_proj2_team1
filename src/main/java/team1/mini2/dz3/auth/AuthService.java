package team1.mini2.dz3.auth;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import org.springframework.validation.annotation.Validated;


@Validated
public interface AuthService {
	JwtDto login(@Valid AuthDto UserVoDto) ;

	JwtDto reissue(@NotBlank String bearerToken);
}
