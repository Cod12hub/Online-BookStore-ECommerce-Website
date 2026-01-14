package com.mains.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mains.bin.Book;
import com.mains.repositry.UserRepositry;
@Controller
public class adhandaler {
	@Autowired
	private UserRepositry repo;
	
	
	@RequestMapping("/admin")
	public String getData(Model m) {
	    List<Book> li = repo.findAll();
	    m.addAttribute("e_data",li);  
	    System.out.println(li);
	    return "adview";
	}
	
	
	 
	
	   
}
