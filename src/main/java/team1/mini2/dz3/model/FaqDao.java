package team1.mini2.dz3.model;

import java.util.Map;
import java.util.List;

public interface FaqDao {
	List<FaqDto> getList(Map<String, String> map);
	List<FaqDto> getListWithTitle(Map<String, String> map);
	List<FaqDto> getListWithContent(Map<String, String> map);
	List<FaqDto> getListWithRegDate(Map<String, String> map);
	int getWithTitleCount(String key);
	int getWithContentCount(String key);
	int getWithRegDateCount(String key);
	FaqDto get(int faqNo);
	int getCount();
	void add(Map<String, String> map);
	void remove(int faqNo);
	void set(Map<String, String> map);
}
