package com.sosee.base.dao;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * This base class is prepared for subclass to do CRUD easily.
 * 
 * <pre>
 * &lt;p/&gt;
 * Author : outworld
 * Date   : 2009-06-02
 * Time   : 11:30:00
 * Version: 1.0
 * </pre>
 */
public class AbstractBaseDao<T> {

	public final Logger log = Logger.getLogger(getClass());

	private final Class<T> clazz;

	private HibernateTemplate hibernateTemplate;

	/**
	 * Inject domain's class type in constructor.
	 * 
	 * @param clazz
	 *            Domain's class.
	 */
	public AbstractBaseDao(Class<T> clazz) {
		this.clazz = clazz;
	}

	/**
	 * @spring.property name="hibernateTemplate" ref="hibernateTemplate"
	 */
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	/* 根据主键查询T */
	@SuppressWarnings("unchecked")
	public T queryById(Serializable id) {
		T t = (T) hibernateTemplate.get(clazz, id);
		if (t == null)
			throw new DataRetrievalFailureException("Object not found.");
		// it is strange that load() method return a lazy-loading proxy object
		// and it may cause LazyInitializationException!
		return t;
	}

	@SuppressWarnings("unchecked")
	public List<T> queryAll(String queryString) {
		return this.hibernateTemplate.find(queryString);
	}

	/**
	 * Default implementation of creating new domain object.
	 */
	public Serializable create(T t) {
		return hibernateTemplate.save(t);
	}

	/**
	 * Default implementation of deleting new domain object.
	 */
	public void delete(T t) {
		hibernateTemplate.delete(t);
	}

	/**
	 * Default implementation of updating domain object.
	 */
	public void update(T t) {
		hibernateTemplate.update(t);
	}

	/**
	 * Do an update hql query, return the affected rows.
	 * 
	 * @param updateHql
	 *            Update HQL.
	 * @param values
	 *            Parameters or null if none.
	 * @return The affected rows.
	 */
	public int executeUpdate(final String updateHql, final Object[] values) {
		HibernateCallback updateCallback = new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query =  session.createQuery(updateHql);
				
				if (values != null) {
					for (int i = 0; i < values.length; i++)
						query.setParameter(i, values[i]);
				}
				return new Integer(query.executeUpdate());
			}
		};
		return ((Integer) hibernateTemplate.execute(updateCallback)).intValue();
	}

	/**
	 * Prepared for sub-class for convenience. Query for list and also return
	 * total results' number.
	 * 
	 * @param selectCount
	 *            HQL for "select count(*) from ..." and should return a Long.
	 * @param select
	 *            HQL for "select * from ..." and should return object list.
	 * @param values
	 *            For prepared statements.
	 * @param page
	 *            Page object for store page information.
	 */
	@SuppressWarnings("rawtypes")
	public List queryForList(final String selectCount, final String select, final Object[] values, final Page page) {
		Long count = (Long) queryForObject(selectCount, values);
		page.setTotalCount(count.intValue());
		if (page.isEmpty())
			return Collections.EMPTY_LIST;
		return queryForList(select, values, page);
	}

	@SuppressWarnings("rawtypes")
	public List queryForList(final String select, final Object[] values) {
		// select:
		HibernateCallback selectCallback = new HibernateCallback() {
			public Object doInHibernate(Session session) {
				Query query=null;
				if (select.indexOf("from") !=-1 || select.indexOf("FROM") !=-1){
					query = session.createQuery(select);
				}else{
					query = session.getNamedQuery(select);
				}
				
				if (values != null) {
					for (int i = 0; i < values.length; i++)
						query.setParameter(i, values[i]);
				}
				return query.list();
			}
		};

		return (List) hibernateTemplate.executeFind(selectCallback);
	}

	@SuppressWarnings("rawtypes")
	public List queryForList(final String select, final Page page) {
		return (List) this.queryForList(select,null,page);
	}
	/**
	 * Prepared for sub-class for convenience. Query for list but do not return
	 * total results' number.
	 * 
	 * @param select
	 *            HQL for "select * from ..." and should return object list.
	 * @param values
	 *            For prepared statements.
	 * @param page
	 *            Page object for store page information.
	 */
	@SuppressWarnings("rawtypes")
	public List queryForList(final String select, final Object[] values, final Page page) {
		// select:
		HibernateCallback selectCallback = new HibernateCallback() {
			public Object doInHibernate(Session session) {
				Query query = session.createQuery(select);
				
				if (values != null) {
					for (int i = 0; i < values.length; i++)
						query.setParameter(i, values[i]);
				}
				page.setTotalCount(query.list().size());
				return query.setFirstResult(page.getFirstResult()).setMaxResults(page.getPageSize()).list();
			}
		};
		return (List) hibernateTemplate.executeFind(selectCallback);
	}

	/**
	 * Prepared for sub-class for convenience. Query for unique result.
	 * 
	 * @param select
	 *            HQL for "select * from ..." and should return unique object.
	 * @param values
	 *            For prepared statements.
	 */
	public Object queryForObject(final String select, final Object[] values) {
		HibernateCallback selectCallback = new HibernateCallback() {
			public Object doInHibernate(Session session) {
				Query query = null;
				if (select.indexOf("from") !=-1 || select.indexOf("FROM") !=-1){
					query = session.createQuery(select);
				}else{
					query = session.getNamedQuery(select);
				}
				if (values != null) {
					for (int i = 0; i < values.length; i++)
						query.setParameter(i, values[i]);
				}
				return query.uniqueResult();
			}
		};
		return hibernateTemplate.execute(selectCallback);
	}

	public Object queryForObject(final DetachedCriteria dc) {
		HibernateCallback callback = new HibernateCallback() {
			public Object doInHibernate(Session session) {
				return dc.getExecutableCriteria(session).uniqueResult();
			}
		};
		return hibernateTemplate.execute(callback);
	}

	/**
	 * Prepared for sub-class for convenience.
	 */
	@SuppressWarnings("rawtypes")
	public List queryForList(final DetachedCriteria dc, final Page page) {
		HibernateCallback callback = new HibernateCallback() {
			public Object doInHibernate(Session session) {
				Criteria c = dc.getExecutableCriteria(session);
				if (page == null)
					return c.list();
				return PaginationCriteria.query(c, page);
			}
		};
		return hibernateTemplate.executeFind(callback);
	}

	/**
	 * Prepared for sub-class for convenience.
	 */
	public Object uniqueResult(final DetachedCriteria dc) {
		HibernateCallback callback = new HibernateCallback() {
			public Object doInHibernate(Session session) {
				return dc.getExecutableCriteria(session).uniqueResult();
			}
		};
		return hibernateTemplate.execute(callback);
	}

}

/**
 * A PaginationCriteria can execute both "select count(*)" and "select * from"
 * queries, and set Page object automatically. This class uses reflect to remove
 * and restore "order by" conditions.
 * 
 * <pre>
 * &lt;p/&gt;
 * Author : outworld
 * Date   : 2009-06-02
 * Time   : 11:30:00
 * Version: 1.0
 * </pre>
 */

class PaginationCriteria {

	public final static Logger log = Logger.getLogger(PaginationCriteria.class);

	private static Field orderEntriesField = getField(Criteria.class, "orderEntries");

	@SuppressWarnings("rawtypes")
	public static List query(Criteria c, Page page) {
		// first we must detect if any Order defined:
		// Hibernate code: private List orderEntries = new ArrayList();
		List _old_orderEntries = (List) getFieldValue(orderEntriesField, c);
		boolean restore = false;
		if (_old_orderEntries.size() > 0) {
			restore = true;
			setFieldValue(orderEntriesField, c, new ArrayList());
		}
		c.setProjection(Projections.rowCount());
		int rowCount = ((Long) c.uniqueResult()).intValue();
		page.setTotalCount(rowCount);
		if (rowCount == 0) {
			// no need to execute query:
			return Collections.EMPTY_LIST;
		}
		// query:
		if (restore) {
			// restore order conditions:
			setFieldValue(orderEntriesField, c, _old_orderEntries);
		}
		return c.setFirstResult(page.getFirstResult()).setMaxResults(page.getPageSize()).setFetchSize(page.getPageSize()).list();
	}

	private static Field getField(@SuppressWarnings("rawtypes") Class clazz, String fieldName) {
		try {
			return clazz.getDeclaredField(fieldName);
		} catch (Exception e) {

			log.warn("Class.getDeclaredField(String) failed.", e);
			throw new RuntimeException(e);
		}
	}

	private static Object getFieldValue(Field field, Object obj) {
		field.setAccessible(true);
		try {
			return field.get(obj);
		} catch (Exception e) {
			log.warn("Field.get(Object) failed.", e);
			throw new RuntimeException(e);
		}
	}

	private static void setFieldValue(Field field, Object target, Object value) {
		field.setAccessible(true);
		try {
			field.set(target, value);
		} catch (Exception e) {
			log.warn("Field.set(Object, Object) failed.", e);
			throw new RuntimeException(e);
		}
	}
}
