package com.project.user.service.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AutoComMapper {
	List<Map<String, Object>>autocomplete(Map<String, Object> paramMap) throws Exception;
}
