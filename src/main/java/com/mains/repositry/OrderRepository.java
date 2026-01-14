package com.mains.repositry;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mains.bin.PurchaseOrder;
import com.mains.bin.UserB;

public interface OrderRepository extends JpaRepository<PurchaseOrder, Long> {
    List<PurchaseOrder> findByUser(UserB user); 
    List<PurchaseOrder> findByOrderDateBetween(Date startDate, Date endDate);
    List<PurchaseOrder> findByUserId(Integer userId);


}
