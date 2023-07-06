package com.example.demo20.service;


import com.example.demo20.responsitory.TaiKhoanResponesitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
public class UserImpl implements UserDetailsService {

    @Autowired
    TaiKhoanResponesitory taiKhoanResponesitory;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        return taiKhoanResponesitory.getByUsername(username);
    }
}
