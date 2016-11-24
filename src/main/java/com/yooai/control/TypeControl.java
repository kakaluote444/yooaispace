package com.yooai.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.modal.Type;
import com.yooai.service.TypeService;

@Controller
public class TypeControl {
	@Autowired
	private TypeService typeService;
	
	@RequestMapping("type/getAll")
	@ResponseBody
	public List<Type> getAllSayType(){
		return typeService.getAllSayType();
	}
	
	@RequestMapping("type/{sayId}/bySayId")
	@ResponseBody
	public List<String> getSayTypeName(@PathVariable("sayId")int sayId){
		return typeService.getTypeNameBySayId(sayId);
	}
	
}
