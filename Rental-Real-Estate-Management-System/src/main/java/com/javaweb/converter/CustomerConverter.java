package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerCreateRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;
    public CustomerDTO toCustomerDTO(CustomerEntity customerEntity){
        CustomerDTO customerDTO = modelMapper.map(customerEntity, CustomerDTO.class);
        return customerDTO;
    }
    public CustomerEntity toCustomerEntity(CustomerCreateRequest customerCreateRequest){
        CustomerEntity customerEntity = modelMapper.map(customerCreateRequest, CustomerEntity.class);
        return customerEntity;
    }
    public CustomerCreateRequest toCustomerCreateRequest(CustomerEntity customerEntity){
        CustomerCreateRequest customerCreateRequest = modelMapper.map(customerEntity, CustomerCreateRequest.class);
        return customerCreateRequest;
    }
}
