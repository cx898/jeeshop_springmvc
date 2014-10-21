package net.jeeshop.services.manage.system.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.jeeshop.core.Services;
import net.jeeshop.core.dao.BaseDao;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.core.system.bean.Menu;
import net.jeeshop.core.system.bean.MenuItem;
import net.jeeshop.core.system.bean.MenuType;
import net.jeeshop.core.system.bean.User;


/**
 * 菜单业务逻辑实现类
 * 
 * @author huangf
 * 
 */
public class MenuService implements Services<Menu> {
	private BaseDao dao;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	/**
	 * 查询指定用户拥有的全部菜单资源
	 * 
	 * @param param
	 * @return
	 */
	public List selectList(Map<String, String> param) {
		if (param == null)
			return dao.selectList("menu.selectList");
		return dao.selectList("menu.selectList", param);
	}

	/**
	 * 查询指定菜单下的全部子菜单
	 * 
	 * @param menu
	 * @return
	 */
	public List<Menu> selectList(Menu menu) {
		return dao.selectList("menu.selectMenus", menu);
	}

	public Menu selectOne(Menu menu) {
		return (Menu) dao.selectOne("menu.selectOne", menu);
	}

	public int getCount(Menu menu) {
		return dao.getCount("menu.getCount", menu);
	}

	public int insert(Menu menu) {
		return dao.insert("menu.insert", menu);
	}

	public int delete(Menu menu) {
		return dao.delete("menu.delete", menu);
	}

	public int update(Menu menu) {
		return dao.update("menu.update", menu);
	}

	/**
	 * 根据菜单ID，删除菜单树勾选的节点。某个非叶子节点即便它下面的所有的叶子节点都被勾选也不会被本次删除操作删除掉，
	 * 这样做是为了避免只想删除某个非叶子节点下面的所有子节点
	 * 
	 * @param ids
	 * @param deleteParent
	 *            是否级联删除父菜单,在父菜单下的所有子菜单全部勾选的情况下,1:级联删除,-1不级联
	 */
	public void deletes(String ids, String deleteParent) {

		String[] idArr = ids.split(",");
//		System.out.println(Arrays.toString(idArr));
		// 按照从小到大排序
		Arrays.sort(idArr, new Comparator<String>() {
			public int compare(String o1, String o2) {
				int a1 = Integer.parseInt(o1);
				int a2 = Integer.parseInt(o2);
				if (a1 > a2) {
					return 1;
				} else if (a1 < a2) {
					return -1;
				}
				return 0;
			}
		});
		Menu menu = new Menu();

		if (deleteParent.equals("-1")) {
			// 从菜单ID最小的开始删起，避免先把ID大的删除了，倒置ID小的成为了叶子节点而被删除掉
			for (int i = 0; i < idArr.length; i++) {
				/*
				 * 1、菜单下没有子菜单，直接删除 2、菜单下有子菜单，检查所有的子菜单是否全部已经勾选 A)全部勾选，则可以删除。
				 * B)没有全部勾选，则不能删除。
				 */
				menu.clear();
				menu.setPid(idArr[i]);
				if (this.getCount(menu) == 0) {
					// 指定节点下没有子菜单，删除指定的菜单(叶子)
					menu.clear();
					menu.setId(idArr[i]);
					this.delete(menu);
				}
			}
		} else if (deleteParent.equals("1")) {
			for (int i = idArr.length - 1; i >= 0; i--) {
				/*
				 * 1、菜单下没有子菜单，直接删除 2、菜单下有子菜单，检查所有的子菜单是否全部已经勾选 A)全部勾选，则可以删除。
				 * B)没有全部勾选，则不能删除。
				 */
				menu.clear();
				menu.setPid(idArr[i]);
				if (this.getCount(menu) == 0) {
					// 指定节点下没有子菜单，删除指定的菜单(叶子)
					menu.clear();
					menu.setId(idArr[i]);
					this.delete(menu);
				} else {
					menu.clear();
					menu.setPid(idArr[i]);
					// 查询指定菜单下的全部子菜单
					List<Menu> menus = this.selectList(menu);
//					System.out.println("find menus:" + menus);
					if (menus != null && menus.size() > 0) {
						if (checkAllContains(idArr, menus)) {
							this.delete(menu);
//							System.out.println("del menus:" + menu);
						}
					}
				}
			}
		} else {
			throw new NullPointerException("deleteParent:" + deleteParent);
		}
	}

	/**
	 * 检查指定的菜单列表是否全部存在于另一个列表中
	 * 
	 * @param idArr
	 *            待删除的菜单列表
	 * @param list
	 *            被检查的菜单列表
	 * @return 全部存在返回true，否则返回false
	 */
	private boolean checkAllContains(String[] idArr, List<Menu> list) {
		int n = list.size();
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < idArr.length; j++) {
				if (list.get(i).getId().equals(idArr[j])) {
					n--;
					break;
				}
			}
		}
		// System.out.println("=========="+Arrays.toString(idArr)+",list:"+list+",n:"+n);
		return n == 0 ? true : false;
	}

	/**
	 * 添加子菜单、修改父菜单
	 * 
	 * @param updateP
	 *            -1：修改父菜单，否则添加子菜单并且可能修改父菜单
	 * @param menu
	 *            父菜单
	 * @param itemMenu
	 *            子菜单
	 * @return
	 */
	public boolean addOrUpdate(String updateP, Menu menu, Menu itemMenu) {
		if (itemMenu != null) {
			// 添加子菜单
			insert(itemMenu);
		}
		// 修改父菜单
		update(menu);
		return true;
	}

	// 加载根节点
	public List<MenuItem> loadMenus(User u, String pid, String url) {
		Map<String, String> param = new HashMap<String, String>();
		if (u != null && u.getRid() != null) {
			param.put("rid", u.getRid());// 角色ID
		}
		param.put("pid", pid);// 菜单父ID
		List<Menu> menus = dao.selectList("menu.selectMenus", param);
		// 创建菜单集合
		List<MenuItem> root = new ArrayList<MenuItem>();
		// 循环添加菜单到菜单集合
//		for (Iterator<Menu> it = menus.iterator(); it.hasNext();) {
		for(int i=0;i<menus.size();i++){
//			Menu entry = it.next();
			Menu menu = menus.get(i);
			MenuItem item = new MenuItem(menu.getName(), null);
			item.setId(menu.getId());
			item.setPid(menu.getPid());
			item.setMenuType(menu);
			if (url != null) {
				item.setUrl(url);
			} else {
				item.setUrl(menu.getUrl());
			}
			root.add(item);
		}
		// 加载子菜单，注意 只加载type为模块级或页面级的
		for (int i = 0; i < root.size(); i++) {
			MenuItem ee = root.get(i);
			if(ee.getType()==null || ee.getType().toString().equals("") || ee.getType().equals(MenuType.button)){
				continue;
			}
			
			Menu mm = new Menu();
			mm.setPid(ee.getId());
			loadChildrenByPid(ee, mm, url, u);
		}

		return root;
	}

	/**
	 * 根据父ID加载子节点
	 * @param item
	 * @param menu
	 * @param url
	 * @param u
	 */
	private void loadChildrenByPid(MenuItem item, Menu menu, String url, User u) {
		Map<String, String> param = new HashMap<String, String>();

		if (u != null && u.getRid() != null)
			param.put("rid", u.getRid());
		param.put("pid", menu.getPid());
		// 加载菜单节点
		List<Menu> data = dao.selectList("menu.selectMenus", param);
		if (data == null || data.size() == 0) {
			return;
		}
		if (item.getChildren() == null)
			item.setChildren(new ArrayList<MenuItem>());
		// 创建菜单节点
		for (int i = 0; i < data.size(); i++) {
			Menu entry = data.get(i);
			MenuItem addItem = new MenuItem(entry.getName(), null);
			addItem.setId(entry.getId());
			addItem.setPid(entry.getPid());
			addItem.setMenuType(entry);
			if (url != null) {
				addItem.setUrl(url);
			} else {
				addItem.setUrl(entry.getUrl());
			}
			item.getChildren().add(addItem);
		}
		// 根据菜单节点进行递归加载
		for (int i = 0; i < item.getChildren().size(); i++) {
			Menu itemMenu = new Menu();

			itemMenu.setPid(item.getChildren().get(i).getId());
			loadChildrenByPid(item.getChildren().get(i), itemMenu, url, u);
		}
	}

	public PagerModel selectPageList(Menu e) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deletes(String[] ids) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Menu selectById(String id) {
		return (Menu) dao.selectOne(id);
	}
}
