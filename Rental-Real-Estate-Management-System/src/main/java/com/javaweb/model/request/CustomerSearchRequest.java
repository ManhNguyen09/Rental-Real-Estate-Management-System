package com.javaweb.model.request;

import com.javaweb.entity.BaseEntity;
import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerSearchRequest{
    private String fullname;
    private String phone;
    private String email;
    private Long staffId;
}
