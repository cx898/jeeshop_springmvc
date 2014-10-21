/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.jeeshop.services.front.indexImg.dao;

import java.util.List;

import net.jeeshop.core.DaoManager;
import net.jeeshop.services.front.indexImg.bean.IndexImg;


public interface IndexImgDao extends DaoManager<IndexImg> {

	/**
	 * @param i
	 * @return
	 */
	List<IndexImg> getImgsShowToIndex(int i);

}
