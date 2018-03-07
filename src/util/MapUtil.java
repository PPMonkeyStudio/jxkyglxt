package util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.ArrayUtils;

public class MapUtil {
	/**
	 * JavaBean对象的List集合转化成
	 * 
	 * @param javaBean
	 * @return
	 * @author jqlin
	 */
	public static List<Map<String, String>> java2Map(List<Object> list_obj, String export_num) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			for (int obj_num = 0; obj_num < list_obj.size(); obj_num++) {
				LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
				Object javaBean = list_obj.get(obj_num);
				// 获取javaBean属性
				Field[] fs = javaBean.getClass().getDeclaredFields();
				// 将所需要导出的属性索引（字符串）分割成数组
				String[] arr_num = export_num.split(",");
				// 遍历属性
				for (int i = 0; i < arr_num.length; i++) {
					Field f = fs[Integer.parseInt(arr_num[i])];
					f.setAccessible(true);
					map.put(f.getName(), f.get(javaBean) + "");
				}
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
