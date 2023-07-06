package com.example.demo20.responsitory;


import com.example.demo20.model.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TaiKhoanResponesitory extends JpaRepository<TaiKhoan, Integer> {

    @Query(value = "SELECT * FROM tbl_taikhoan WHERE username = ?1", nativeQuery = true)
    TaiKhoan getByUsername(String username);


}
