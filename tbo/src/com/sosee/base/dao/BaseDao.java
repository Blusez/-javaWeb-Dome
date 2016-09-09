package com.sosee.base.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Define some generate CRUD operations.
 * 
 * @author outworld
 * date 2009-06-02
 * @param <T> Domain type.
 */
public interface BaseDao<T> {

    /**
     * Query object by specified id.
     */
    T queryById(Serializable id);

    /**
     * Create an domain object.
     */
    Serializable create(T t);

    /**
     * Delete an object.
     */
    void delete(T t);

    /**
     * Update an object.
     */
    void update(T t);
    
    /**
     * Query all object without page.
     */
    
    List<T> queryAll(String queryString);

    List<T> queryForList(String select, Object[] values);
    
    List<T> queryForList(String select, Page page);
    
    List<T> queryForList(String select, Object[] values, Page page);
    
    Object queryForObject(String select, Object[] values);
    
    List<T> queryForList(String selectCount, String select, final Object[] values, final Page page);
    
    public int executeUpdate(final String updateHql, final Object[] values);
}
