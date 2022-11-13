package team1.mini2.dz3.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import team1.mini2.dz3.model.RestaurantDao;
import team1.mini2.dz3.model.RestaurantDto;
import team1.mini2.dz3.model.RestaurantPageVo;


@Component
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public RestaurantDto getRestaurant(int restaurantNo) {
		return sqlSession.getMapper(RestaurantDao.class).get(restaurantNo);
	}


	@Override
	public List<RestaurantDto> getRestaurantPage(int page, RestaurantDto dto) {
		
		if(dto == null) {
			dto = new RestaurantDto();
		}
		dto.setPageVo(new RestaurantPageVo(page));
		return sqlSession.getMapper(RestaurantDao.class).getList(dto);
	}
	@Override
	public int getRestaurantCount(RestaurantDto dto) {
			return sqlSession.getMapper(RestaurantDao.class).getCount(dto);
	}

	@Override
	public int getRestaurantPageCount(RestaurantDto dto) {
		return RestaurantPageVo.calculatePageCount(sqlSession.getMapper(RestaurantDao.class).getCount(dto));

	}	

}
