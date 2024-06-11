package com.javaweb.enums;


import java.util.*;

public enum BuildingType {
    TANG_TRET ("Tầng Trệt "),
    NGUYEN_CAN ("Nguyên Căn "),
    NOI_THAT ("Nội Thất ");

    private final String name;

    BuildingType(String name) {
        this.name = name;
    }

    public String getCode() {
        return name;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new TreeMap<>();
        for(BuildingType item : BuildingType.values()){
            listType.put(item.toString() , item.name);
        }
        return listType;
    }
}
