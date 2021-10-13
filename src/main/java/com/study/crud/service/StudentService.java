package com.study.crud.service;

import com.study.crud.bean.Student;
import com.study.crud.bean.StudentExample;
import com.study.crud.dao.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StudentService {
    @Autowired
    StudentMapper studentMapper;
    public List<Student> getAll() {
        return studentMapper.selectByExampleWithDept(null);
    }

    public void saveStu(Student student) {
        studentMapper.insertSelective(student);
    }

    public boolean checkuser(String name) {
        StudentExample example = new StudentExample();
        StudentExample.Criteria criteria = example.createCriteria();
        criteria.andStuNameEqualTo(name);
        long count = studentMapper.countByExample(example);
        return count ==0;
    }

    public Student getStu(Integer id) {
        Student student = studentMapper.selectByPrimaryKey(id);
        return student;
    }

    public void updateStu(Student student) {
        studentMapper.updateByPrimaryKeySelective(student);
    }

    public void deleteStu(Integer id) {
        studentMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        StudentExample example = new StudentExample();
        StudentExample.Criteria criteria = example.createCriteria();
        criteria.andStuIdIn(ids);
        studentMapper.deleteByExample(example);
    }
}
