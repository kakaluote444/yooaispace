package com.yooai.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.service.PictureService;

@Controller
public class PictureControl {
	@Autowired
	private PictureService pictureService;
	@RequestMapping("say/{sayId}/images")
	@ResponseBody
	public List<String> getSayImages(@PathVariable("sayId")Integer sayId){
		return pictureService.getSayImages(sayId);
	}
	
}
