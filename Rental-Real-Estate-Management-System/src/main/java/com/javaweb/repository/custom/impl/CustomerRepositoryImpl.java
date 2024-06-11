package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Map;

@Repository
@Primary
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public List<CustomerEntity> findAll(Map<String, Object> conditions) {
        StringBuilder sql = new StringBuilder("SELECT c.* FROM customer c ");
        joinTable(conditions, sql);
        sql.append(" WHERE 1 = 1 AND c.is_active = 1 ");
        appendConditions(conditions, sql);
        sql.append(" GROUP BY c.id ");
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    private void joinTable(Map<String, Object> conditions, StringBuilder sql){
        if (conditions.get("staffId") != null && conditions.get("staffId").toString().trim() != ""){
            sql.append(" JOIN assignmentcustomer ass ON c.id = ass.customerid ");
        }
    }

    private void appendConditions(Map<String, Object> conditions, StringBuilder sql){
        for(Map.Entry<String, Object> entry : conditions.entrySet()){
            String key = entry.getKey();
            Object value = entry.getValue();
            if(key.equals("staffId") && value != null && value.toString().trim() != ""){
                sql.append(" AND ass.staffid = " + value);
            }
            else{
                if (!key.equals("d-3677046-p") && value != null && value.toString().trim() != ""){
                    sql.append(" AND c." + key + " LIKE '%" + value + "%' ");
                }
            }
        }
    }
}
