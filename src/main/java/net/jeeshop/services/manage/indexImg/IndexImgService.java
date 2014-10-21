/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.jeeshop.services.manage.indexImg;

import java.util.List;

import net.jeeshop.core.Services;
import net.jeeshop.services.manage.indexImg.bean.IndexImg;
import net.jeeshop.services.manage.product.bean.Product;


/**
 * @author huangf
 */
public interface IndexImgService extends Services<IndexImg> {

	/**
	 * 加载图片显示到门户
	 * @param i
	 */
	List<IndexImg> getImgsShowToIndex(int i);

}
