package com.crud;

import com.study.crud.bean.Department;
import com.study.crud.bean.Student;
import com.study.crud.dao.DepartmentMapper;
import com.study.crud.dao.StudentMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class CRUDTest {
//    @Autowired
//    DepartmentMapper departmentMapper;
//    @Autowired
//    StudentMapper studentMapper;
//    @Autowired
//    SqlSession sqlSession;
//    @Test
//    public void test(){
//        System.out.println(departmentMapper);
////        批量操作
//        StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
//
//        for(int i =0;i<1000;i++){
//            String uuid = UUID.randomUUID().toString().substring(0,5)+i;
//            mapper.insertSelective(new Student(null,uuid,"M",uuid+"@study.com",1));
//
//        }
//        System.out.println("批量成功");
//    }
}
