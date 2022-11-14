package team1.mini2.dz3.service;

import java.util.List;
import java.util.Map;

import team1.mini2.dz3.model.FaqDto;

public interface FaqService {
	List<FaqDto> getFaqPage(int page);
	List<FaqDto> getFaqPageWithTitle(int page, String key);
	List<FaqDto> getFaqPageWithContent(int page, String key);
	List<FaqDto> getFaqPageWithRegDate(int page, String key);
	int getFaqPageWithTitleCount(String key);
	int getFaqPageWithContentCount(String key);
	int getFaqPageWithRegDateCount(String key);
	int getFaqWithTitleCount(String key);
	int getFaqWithContentCount(String key);
	int getFaqWithRegDateCount(String key);
	FaqDto getFaq(int faqNo);
	void addFaq(Map<String, String> map);
	void removeFaq(int faqNo);
	void setFaq(Map<String, String> map);
	int getFaqCount();
	int getFaqPageCount();
}
