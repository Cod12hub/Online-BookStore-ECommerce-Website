package com.mains.repositry;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mains.bin.AdminD;


public interface AdminTwoRepository extends JpaRepository<AdminD, Long> {
    AdminD findByEmail(String email);

}


