package team1.mini2.dz3.service;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.Min;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.mini2.dz3.model.member.MemberDao;
import team1.mini2.dz3.model.member.MemberSearchKeyDto;
import team1.mini2.dz3.model.member.MemberVo;
import team1.mini2.dz3.model.member.PageVo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MemberVo> getMemberPage(@Min(1) int page, @Valid MemberSearchKeyDto optKey) {
		if(optKey==null) {
			optKey = new MemberSearchKeyDto();
		}
		optKey.setPageVo(new PageVo(page));
		return sqlSession.getMapper(MemberDao.class).getList(optKey);
	}

	@Override
	public int getMemberPageCount(@Valid MemberSearchKeyDto optKey) {
		if(optKey==null) {
			optKey = new MemberSearchKeyDto();
		}
		return PageVo.calculatePageCount(sqlSession.getMapper(MemberDao.class).getCount(optKey));
	}

	@Override
	public int getMemberCount(@Valid MemberSearchKeyDto optKey) {
		if(optKey==null) {
			optKey = new MemberSearchKeyDto();
		}
		return sqlSession.getMapper(MemberDao.class).getCount(optKey);
	}

	@Override
	public MemberVo getMember(@Min(1) int memberNo) {
		return sqlSession.getMapper(MemberDao.class).get(memberNo);
	}

	@Override
	public boolean removeMember(@Min(1) int memberNo) {
		return sqlSession.getMapper(MemberDao.class).remove(memberNo)>0;
	}
}
