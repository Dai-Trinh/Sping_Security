package com.example.demo20.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminTestController {

    @RequestMapping(value = "/admin/trang-chu", method = RequestMethod.GET)
    public String test(){
        return "test2";
    }


}
