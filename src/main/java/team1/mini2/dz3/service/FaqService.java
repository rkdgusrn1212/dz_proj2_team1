package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.FaqDto;

public interface FaqService {
	List<FaqDto> getFaqPage(int page);
	FaqDto getFaq(int faqNo);
	void addFaq(Map<String, String> map);
	void removeFaq(int faqNo);
	void setFaq(Map<String, String> map);
	int getFaqCount();
}
