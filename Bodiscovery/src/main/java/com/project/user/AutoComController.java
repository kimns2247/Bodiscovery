package com.project.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.user.service.AutoComService;

@Controller
public class AutoComController {

	@Autowired
	AutoComService service;
	
	@RequestMapping(value = "/autocomplete")
	public @ResponseBody Map<String, Object> autocomplete
    						(@RequestParam Map<String, Object> paramMap) throws Exception{

		List<Map<String, Object>> resultList = service.autocomplete(paramMap);
		paramMap.put("resultList", resultList);
		System.out.println(resultList);
		return paramMap;
	}
}