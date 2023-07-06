package com.example.demo20.responsitory;


import com.example.demo20.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RoleResponesitory extends JpaRepository<Role, Integer> {

    @Query(value = "SELECT * FROM tbl_role WHERE role = ?1", nativeQuery = true)
    List<Role> getByRole(String role);
}
