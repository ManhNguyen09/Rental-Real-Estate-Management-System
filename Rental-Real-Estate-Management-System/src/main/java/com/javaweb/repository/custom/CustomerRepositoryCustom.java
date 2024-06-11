package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;

import java.util.List;
import java.util.Map;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> findAll(Map<String, Object> conditions);
}
