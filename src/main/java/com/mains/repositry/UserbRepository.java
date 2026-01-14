package com.mains.repositry;
import org.springframework.data.jpa.repository.JpaRepository;

import com.mains.bin.UserB;


public interface UserbRepository  extends JpaRepository<UserB, Long>{
	UserB findByEmail(String email);

}
