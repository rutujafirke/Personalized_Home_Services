package com.homemate.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.homemate.entities.OrderTbl;

public interface OrderTableRepository extends JpaRepository<OrderTbl, Integer>{

}
