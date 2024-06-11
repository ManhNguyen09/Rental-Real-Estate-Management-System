package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerCreateRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import com.javaweb.utils.CustomerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private CustomerConverter customerConverter;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CustomerUtils customerUtils;
    @Override
    public List<CustomerDTO> findAll(Map<String, Object> conditions) {
        List<CustomerEntity> customerEntityList = customerRepository.findAll(conditions);
        List<CustomerDTO> customerDTOS = new ArrayList<>();
        for(CustomerEntity c : customerEntityList){
            customerDTOS.add(customerConverter.toCustomerDTO(c));
        }
        return customerDTOS;
    }

    @Override
    public ResponseDTO save(CustomerCreateRequest customerCreateRequest) {
        ResponseDTO responseDTO = new ResponseDTO();
        CustomerEntity customerEntity = customerConverter.toCustomerEntity(customerCreateRequest);;
        if(customerCreateRequest.getId() != null){
            CustomerEntity customerEntityTmp = customerRepository.findById(customerCreateRequest.getId()).get();
            customerUtils.setCustomerField(customerEntity, customerEntityTmp);
        }
        try {
            customerRepository.save(customerEntity);
            if(customerCreateRequest.getId() != null){
                responseDTO.setMessage("Cập nhật khách hàng thành công");
            }
            else responseDTO.setMessage("Thêm khách hàng thành công");
        }
        catch (Exception e){
            System.out.println("e");
            responseDTO.setMessage("Thêm khách hàng thất bại");
        }
        return responseDTO;
    }

    @Override
    public CustomerCreateRequest findOneById(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        if (customerEntity != null) return customerConverter.toCustomerCreateRequest(customerEntity);
        return null;
    }

    @Override
    public ResponseDTO disableActivity(List<Long> id) {
        ResponseDTO responseDTO = new ResponseDTO();
        for(Long i : id){
            CustomerEntity customerEntity = customerRepository.findById(i).get();
            if(customerEntity != null){
                customerEntity.setIsActive(0);
                try {
                    customerRepository.save(customerEntity);
                }
                catch (Exception e){
                    System.out.println(e);
                    responseDTO.setMessage("Xóa khách hàng " + customerEntity.getId() + " thất bại");
                    return responseDTO;
                }
            }
        }
        responseDTO.setMessage("Xóa khách hàng thành công");
        return responseDTO;
    }

    @Override
    public ResponseDTO findStaffsByCustomerId(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        List<UserEntity> staffList = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> assignedStaffList = customerEntity.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        for(UserEntity u : staffList){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(u.getId());
            staffResponseDTO.setFullName(u.getFullName());
            if(assignedStaffList.contains(u)){
                staffResponseDTO.setChecked("checked");
            }
            else staffResponseDTO.setChecked("");
            staffResponseDTOS.add(staffResponseDTO);
        }
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public ResponseDTO updateAssignmentTable(AssignmentDTO assignmentDTO) {
        List<Long> staffIds = assignmentDTO.getStaffs();
        CustomerEntity customerEntity = customerRepository.findById(assignmentDTO.getId()).get();
        List<UserEntity> userEntities = new ArrayList<>();
        for(Long id : staffIds){
            userEntities.add(userRepository.findById(id).get());
        }
        customerEntity.setUserEntities(userEntities);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("success");
        return responseDTO;
    }
}
