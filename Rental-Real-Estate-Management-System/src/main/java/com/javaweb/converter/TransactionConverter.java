package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.TransactionCreateRequest;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class TransactionConverter {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private ModelMapper modelMapper;
    public TransactionEntity toTransactionEntity(TransactionCreateRequest t, Long staffId){
        TransactionEntity transactionEntity = modelMapper.map(t, TransactionEntity.class);
        UserEntity userEntity = userRepository.findById(staffId).get();
        CustomerEntity customerEntity = customerRepository.findById(t.getCustomerId()).get();
        if(t.getId() != null){
            TransactionEntity tmp = transactionRepository.findById(t.getId()).get();
            transactionEntity.setCreatedDate(tmp.getCreatedDate());
            transactionEntity.setCreatedBy(tmp.getCreatedBy());
            transactionEntity.setModifiedDate(new Date());
            transactionEntity.setModifiedBy(userEntity.getUserName());
        }
        else{
            transactionEntity.setCreatedBy(userEntity.getUserName());
        }
        transactionEntity.setCustomer(customerEntity);
        return transactionEntity;
    }
    public TransactionDTO toTransactionDTO(TransactionEntity transactionEntity){
        TransactionDTO transactionDTO = modelMapper.map(transactionEntity, TransactionDTO.class);
        return transactionDTO;
    }
}
