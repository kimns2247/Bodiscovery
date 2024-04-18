package com.project.user.service;

import java.util.List;
import java.util.Map;

public interface AutoComService {
	List<Map<String, Object>>autocomplete(Map<String, Object> paramMap) throws Exception;
}