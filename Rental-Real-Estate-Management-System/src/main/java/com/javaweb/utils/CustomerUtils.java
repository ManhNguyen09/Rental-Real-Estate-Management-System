package com.javaweb.utils;

import com.javaweb.entity.CustomerEntity;
import org.springframework.stereotype.Component;

@Component
public class CustomerUtils {
    public void setCustomerField(CustomerEntity customerEntity, CustomerEntity customerEntityTmp){
        if(customerEntityTmp.getCreatedBy() != null) customerEntity.setCreatedBy(customerEntityTmp.getCreatedBy());
        if(customerEntityTmp.getCreatedDate() != null) customerEntity.setCreatedDate(customerEntityTmp.getCreatedDate());
        if(customerEntityTmp.getUserEntities() != null) customerEntity.setUserEntities(customerEntityTmp.getUserEntities());
    }
}
