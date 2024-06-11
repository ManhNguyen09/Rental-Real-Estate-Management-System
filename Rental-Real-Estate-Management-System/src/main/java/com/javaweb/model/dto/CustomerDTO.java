package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerDTO extends AbstractDTO{
    private String fullname;
    private String phone;
    private String email;
    private String demand;
    private String status;
}
