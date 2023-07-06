package com.example.demo20.controller;


import com.example.demo20.model.Role;
import com.example.demo20.model.TaiKhoan;
import com.example.demo20.responsitory.RoleResponesitory;
import com.example.demo20.responsitory.TaiKhoanResponesitory;
import com.example.demo20.service.UserImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Controller
public class TestController {

    @Autowired
    UserImpl user;

    @Autowired
    RoleResponesitory roleResponesitory;

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public String test2(){
        return "test1";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, @RequestParam(value = "login_error", required = false) String err){

        model.addAttribute("b", err);
        return "dangnhap";
    }

    @RequestMapping(value = {"/dang-ky"}, method = RequestMethod.GET)
    public String dangKyGet(){
        return "dangky";
    }

    @RequestMapping(value = {"/dang-ky"}, method = RequestMethod.POST)
    public String dangKyPost(Model model, @RequestParam("username") String username, @RequestParam("password") String password){
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setUsername(username);
        taiKhoan.setPassword(new BCryptPasswordEncoder(4).encode(password));
        List<Role> roleList = roleResponesitory.getByRole("GUEST");
        taiKhoan.setRole(new HashSet<>(roleList));
        taiKhoan.setId(3); //do id trong csdl quên không để aut nên phải để mặc định vậy
        user.saveTaiKhoan(taiKhoan);
        return "redirect:/login";
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
