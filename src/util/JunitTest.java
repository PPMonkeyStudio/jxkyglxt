package util;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;
import com.teacherms.staffinfomanage.service.AdminService;
import com.teacherms.staffinfomanage.service.TeacherService;
import com.teacherms.system.service.SystemService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext*.xml" })
public class JunitTest {
	@Resource
	private AdminService adminService;
	@Resource
	private TeacherService teacherService;
	@Resource
	private SystemService systemService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@Test
	public void test11() {
		PageVO<Object> list = adminService.getSpecifiedInformationByPaging("TeacherAward", "1", "", "20", "信息与计算机工程学院");
		System.out.println(new Gson().toJson(list));
	}

}
