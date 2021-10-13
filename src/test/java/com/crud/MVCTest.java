package com.crud;

import com.github.pagehelper.PageInfo;
import com.study.crud.bean.Student;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration
//@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
//    @Autowired
//    WebApplicationContext context;
//    MockMvc mockMvc;
//    @Before
//    public void  init(){
//        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
//    }
//    @Test
//    public void test() throws Exception {
//        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/stus").param("pn","5")).andReturn();
//        MockHttpServletRequest request = mvcResult.getRequest();
//        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
//        System.out.println("pageInfo.getPageNum() = " + pageInfo.getPageNum());
//        System.out.println("pageInfo.getPages() = " + pageInfo.getPages());
//        System.out.println("pageInfo.getTotal() = " + pageInfo.getTotal());
//        System.out.println("pageInfo.getNavigatepageNums() = " + pageInfo.getNavigatepageNums());
//        List<Student> list =pageInfo.getList();
//        for(Student student:list){
//            System.out.println("student.getdId() = " + student.getStuId());
//            System.out.println("student.getStuName() = " + student.getStuName());
//        }
//
//    }
}
