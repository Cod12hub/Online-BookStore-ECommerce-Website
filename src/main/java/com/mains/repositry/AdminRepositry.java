package com.mains.repositry;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mains.bin.Book;

public interface AdminRepositry extends JpaRepository<Book,Integer>{

}
