package com.javaweb.service;

import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerCreateRequest;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<CustomerDTO> findAll(Map<String, Object> conditions);
    ResponseDTO save(CustomerCreateRequest customerCreateRequest);
    CustomerCreateRequest findOneById(Long id);
    ResponseDTO disableActivity(List<Long> id);
    ResponseDTO findStaffsByCustomerId(Long id);
    ResponseDTO updateAssignmentTable(AssignmentDTO assignmentDTO);
}
