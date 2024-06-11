package com.javaweb.api.admin;

import com.javaweb.model.request.TransactionCreateRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@RestController
@Transactional
@RequestMapping("/api/transaction")
public class TransactionAPI {
    @Autowired
    private TransactionService transactionService;
    @PostMapping
    public ResponseDTO addOrUpdateTransaction(@RequestBody TransactionCreateRequest transactionCreateRequest){
        Long staffId = SecurityUtils.getPrincipal().getId();
        return transactionService.save(transactionCreateRequest, staffId);
    }
    @GetMapping("/{id}")
    public ResponseDTO getOldTransaction(@PathVariable Long id){
        return transactionService.findById(id);
    }
}
