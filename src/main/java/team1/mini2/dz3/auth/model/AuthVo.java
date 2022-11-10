package team1.mini2.dz3.auth.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AuthVo {
    private String authId;
    private String authPwd;
    private String authAuthority;
    private String authEmail;//본인 인증된 email.
}
