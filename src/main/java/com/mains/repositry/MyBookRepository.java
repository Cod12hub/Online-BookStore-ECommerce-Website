package com.mains.repositry;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mains.bin.Cart;
import com.mains.bin.UserB;
@Repository

public interface MyBookRepository extends JpaRepository<Cart,Integer> {
    List<Cart> findByUser(UserB user); // Fetch cart items for the logged-in user


}

