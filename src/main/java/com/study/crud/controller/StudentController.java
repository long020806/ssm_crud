package com.study.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.crud.bean.Msg;
import com.study.crud.bean.Student;
import com.study.crud.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {

    @Autowired
    StudentService studentService;
    @RequestMapping("/stus")
    @ResponseBody
    public Msg getStusWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,5);
        List<Student> stus =  studentService.getAll();
        PageInfo pageInfo = new PageInfo(stus,5);
        return Msg.success().add("pageInfo",pageInfo);
    }
//    @RequestMapping("/stus")
//    public String getStus(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//        PageHelper.startPage(pn,5);
//        List<Student> stus =  studentService.getAll();
//        PageInfo pageInfo = new PageInfo(stus,5);
//        model.addAttribute("pageInfo",pageInfo);
//
//        return "list";
//    }
    @RequestMapping(value = "stu",method = RequestMethod.POST)
    @ResponseBody
    public Msg save(@Valid Student student, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map= new HashMap<>();

            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("fieldError.getField() = " + fieldError.getField());
                System.out.println("fieldError.getDefaultMessage() = " + fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else{
            studentService.saveStu(student);
            return Msg.success();
        }

    }

    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkuser(@RequestParam("stuName") String name){
        String regx = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!name.matches(regx)){
            return Msg.fail().add("va_msg","用户名必须是2-5位中文和3-16位英文");
        }
        boolean bool = studentService.checkuser(name);
        if(bool){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }
    @RequestMapping(value = "/stu/{id}",method = RequestMethod.GET)
    @ResponseBody
    public  Msg getStu(@PathVariable("id") Integer id){
        Student student = studentService.getStu(id);
        return Msg.success().add("stu",student);
    }
    @RequestMapping(value = "/stu/{stuId}",method = RequestMethod.PUT)
    @ResponseBody
    public  Msg saveStu(Student student){
        studentService.updateStu(student);
        return Msg.success();
    }
    @RequestMapping(value = "/stu/{stuIds}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteStuById(@PathVariable("stuIds") String ids){
        if(ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String str_id : str_ids) {
                del_ids.add(Integer.parseInt(str_id));
            }
            studentService.deleteBatch(del_ids);

        }else{
            int id = Integer.parseInt(ids);
            studentService.deleteStu(id);
        }
        return Msg.success();
    }
}
