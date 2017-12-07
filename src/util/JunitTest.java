package util;

import java.io.*;
import java.util.List;

import javax.annotation.Resource;

import com.teacherms.all.domain.*;

import org.apache.commons.fileupload.FileItem;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.Gson;
import com.teacherms.satffinfomanage.vo.TableInfoAndUserVo;
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

	@Test
	public void test12() {
		TableInfoAndUserVo list = adminService.getTeacherTableInfoById("TeacherAward",
				"0c52c25a-b844-4e6d-9b33-576e8938c611");
		System.out.println(new Gson().toJson(list));
	}

	@Test
	public void test_export() {
		XSSFWorkbook workbook = adminService.getExcel("1,2,3,4,5,6", "TeacherAward",
				"86902b8f-6f7f-4c39-9970-b126e2a2ff5b,88e32f69-8508-4648-b98d-acb1c859cd31");
		try {
			FileOutputStream out = new FileOutputStream("E:/Attachment/张三/TeacherAward/test.xlsx");
			workbook.write(out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void test_teacher_getallinfo() {
		PageVO<Object> listAdmin = teacherService.getTableInfoInPaging("1001", "TeacherAward", "1", "");
		System.out.println(new Gson().toJson(listAdmin));
	}

	@Test
	public void test_teacher_getoneinfo() {
		List<Object> listAdmin = teacherService.userGetTableInfoByTableId("TeacherAward",
				"6ca50c5a-f45d-4fd2-82fc-1d9fb34e67df");
		System.out.println(new Gson().toJson(listAdmin));
	}
}