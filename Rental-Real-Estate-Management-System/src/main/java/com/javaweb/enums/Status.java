package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum Status {
    DAG_XU_LY("Đang xử lý"),
    DA_XU_LY("Đã xử lý"),
    CHUA_XU_LY("Chưa xử lý");

    private final String statusName;
    Status(String statusName) {
        this.statusName = statusName;
    }

    public String getStatusName(){
        return statusName;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new TreeMap<>();
        for(Status item : Status.values()){
            listType.put(item.getStatusName() , item.statusName);
        }
        return listType;
    }

}
