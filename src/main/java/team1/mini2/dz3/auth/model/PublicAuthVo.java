package team1.mini2.dz3.auth.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PublicAuthVo {
	private String id;
	private String authId;
	private String authName;
	private String authEmail;
	private String authAuthority;
}
