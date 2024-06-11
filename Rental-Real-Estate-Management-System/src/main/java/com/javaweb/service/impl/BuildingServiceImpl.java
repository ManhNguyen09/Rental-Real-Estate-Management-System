package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private BuildingDTOConverter buildingDTOConverter;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public List <BuildingSearchResponse> findAll(Map<String, Object> params, List<String> typeCode){
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(params, typeCode);
        List < BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for(BuildingEntity b : buildingEntities){
            result.add(buildingDTOConverter.toBuildingRespone(b));
        }
        return result;
    }

    @Override
    public ResponseDTO save(BuildingDTO buildingDTO){
        ResponseDTO responseDTO = new ResponseDTO();
        BuildingEntity buildingEntity = buildingDTOConverter.toBuildingEntity(buildingDTO);
        List<BuildingEntity> buildingEntities = new ArrayList<>();
        buildingEntities.add(buildingEntity);
        List<UserEntity> userEntities = new ArrayList<>();
        if(buildingEntity.getId() != null){
            userEntities = userRepository.findByBuildingEntityList(buildingEntities);
            responseDTO.setMessage("Cập nhật tòa nhà thành công");
        }else responseDTO.setMessage("Thêm tòa nhà thành công");
        buildingEntity = buildingRepository.save(buildingEntity);
        buildingEntity.setUserEntities(userEntities);
        return responseDTO;
    }

    @Override
    public BuildingDTO findBuildingById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        return buildingDTOConverter.toBuildingDTO(buildingEntity);
    }

    @Override
    public ResponseDTO deleteBuildings(List<Long> buildingIds) {
        rentAreaRepository.deleteBybuilding_IdIn(buildingIds);
        buildingRepository.deleteAllByIdIn(buildingIds);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public ResponseDTO findStaffsByBuildingId(Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffList = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> assignedStaffList = buildingEntity.getUserEntities();
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
    public ResponseDTO updateAssignmentTable(AssignmentDTO assignmentBuildingDTO) {
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getId()).get();
        List<UserEntity> userEntities = new ArrayList<>();
        for(Long id : staffIds){
            userEntities.add(userRepository.findById(id).get());
        }
        buildingEntity.setUserEntities(userEntities);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage("success");
        return responseDTO;
    }
}
