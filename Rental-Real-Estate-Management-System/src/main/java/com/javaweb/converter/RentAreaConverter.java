package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {
    public List<RentAreaEntity> listRentAreaEntity(BuildingDTO buildingDTO, BuildingEntity buildingEntity){
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        if(buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().equals("")){
            String rentAreas[] = buildingDTO.getRentArea().split(",");
            for(String r : rentAreas){
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                try {
                    rentAreaEntity.setValue(Integer.parseInt(r.trim()));
                    rentAreaEntity.setBuilding(buildingEntity);
                    rentAreaEntities.add(rentAreaEntity);
                }catch (Exception e){
                    System.out.println("you haven't entered the number.");
                }
            }
        }
        return rentAreaEntities;
    }
}
