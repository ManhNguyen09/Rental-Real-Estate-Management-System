package com.javaweb.service;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.TransactionCreateRequest;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface TransactionService {
    ResponseDTO save(TransactionCreateRequest transactionCreateRequest, Long staffId);
    List<TransactionDTO> findAllByCodeAndCustomer(String code, Long id);
    ResponseDTO findById(Long id);
}
