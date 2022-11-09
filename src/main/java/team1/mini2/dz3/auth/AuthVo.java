package team1.mini2.dz3.auth;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AuthVo {
    private String authId;
    private String authPwd;
    private String authAuthority;
}
