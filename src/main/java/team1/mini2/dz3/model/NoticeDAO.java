package team1.mini2.dz3.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	// select all
	public List<NoticeDTO> noticeList() {
			
			return sqlSession.selectList("notice.list");
	}
	
	// detailList
	public NoticeDTO detailNotice(int id) {
			NoticeDTO dto = sqlSession.selectOne("notice.detailNotice", id);
			return dto;
	} // end detail
	
	
}
