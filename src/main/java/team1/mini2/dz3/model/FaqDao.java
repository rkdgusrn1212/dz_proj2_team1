package team1.mini2.dz3.model;

import java.util.Map;
import java.util.List;

public interface FaqDao {
	List<FaqDto> getList(Map<String, Integer> map);
	FaqDto get(int faqNo);
	int getCount();
	void add(Map<String, String> map);
	void remove(int faqNo);
	void set(Map<String, String> map);
}
