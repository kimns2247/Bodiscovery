package com.project.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.project.user.service.AutoComService;
import com.project.user.service.dao.AutoComMapper;

@Service
@Primary
public class AutoComServiceImpl implements AutoComService {

	@Autowired
	AutoComMapper mapper;
	
	@Override
	public List<Map<String, Object>>autocomplete(Map<String, Object> paramMap) throws Exception{
		return mapper.autocomplete(paramMap);
	}
}