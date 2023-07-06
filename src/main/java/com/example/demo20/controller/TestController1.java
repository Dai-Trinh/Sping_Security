package com.example.demo20.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController1 {


    @GetMapping("/test1git")
    public String test1git(){
        return "Test 1 Git";
    }

}
