package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingApiOfBuilding")
@Transactional
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @PostMapping
    public ResponseDTO addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        ResponseDTO responseDTO = buildingService.save(buildingDTO);
        return responseDTO;
    }

    @DeleteMapping("/{ids}")
    public ResponseDTO deleteBuildings(@PathVariable List<Long> ids){
        return buildingService.deleteBuildings(ids);
    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO responseDTO = buildingService.findStaffsByBuildingId(id);
        return responseDTO;
    }
    @PostMapping("/assignment")
    public ResponseDTO updateAssignmentBuilding(@RequestBody AssignmentDTO assignmentBuildingDTO){
        ResponseDTO responseDTO = buildingService.updateAssignmentTable(assignmentBuildingDTO);
        return responseDTO;
    }
}
