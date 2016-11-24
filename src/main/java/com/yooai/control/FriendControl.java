package com.yooai.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yooai.service.FriendService;

@Controller
public class FriendControl {
	@Autowired
	private FriendService friendService;
	
}
