package com.javaweb.model.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TransactionCreateRequest {
    private Long id;
    private Long customerId;
    private String note;
    private String code;
}
