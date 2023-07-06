package com.example.demo20.controller;


import com.example.demo20.model.TaiKhoan;
import com.example.demo20.responsitory.TaiKhoanResponesitory;
import com.example.demo20.service.UserImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;

@Controller
public class TestController {

    @Autowired
    UserImpl user;

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public String test2(){
        return "test1";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, @RequestParam(value = "login_error", required = false) String err){

        model.addAttribute("b", err);
        return "dangky";
    }

    @RequestMapping(value = "/guest/testguest", method = RequestMethod.GET)
    public String xinChaoGuest(Model model){
        model.addAttribute("t", "Xin chào guest!!");
        return "taikhoan";
    }

    @GetMapping("/tai-khoan")
    public String getTaiKhoan(Model model){
        model.addAttribute("t", user.loadUserByUsername("admin").toString());
        return "taikhoan";
    }

}
