package team1.mini2.dz3.model.member;

import java.util.List;

public interface MemberDao {
	List<MemberVo> getList(MemberSearchKeyDto memberSearchKeyDto);
	MemberVo get(int memberNo);
	int getCount(MemberSearchKeyDto memberSearchKeyDto);
	int remove(int memberNo);
}
