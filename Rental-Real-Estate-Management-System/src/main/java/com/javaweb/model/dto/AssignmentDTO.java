package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class AssignmentDTO {
    private Long id;
    private List<Long> staffs;
}
