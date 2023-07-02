package com.deyunjiaoyu.sportplay.controller;

import com.alibaba.fastjson.JSON;
import com.deyunjiaoyu.sportplay.bean.QueryInfo;
import com.deyunjiaoyu.sportplay.bean.User;
import com.deyunjiaoyu.sportplay.dao.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
public class UserController {
    @Autowired
    private UserDao userDao;
    @RequestMapping("/allUser")
    public String getUserList(QueryInfo queryInfo){
        //获取查询信息和当前页
        int numbers = userDao.getUserCounts("%" + queryInfo.getQuery() + "%");
        int pageStart = (queryInfo.getPageNum() - 1) * queryInfo.getPageSize();
        List<User> users = userDao.getAllUser("%" + queryInfo.getQuery() + "%", pageStart, queryInfo.getPageSize());
        HashMap<String, Object> res = new HashMap<>();
        res.put("numbers",numbers);
        res.put("data",users);
        String res_string = JSON.toJSONString(res);
        return res_string;
    };

    @RequestMapping("/userState")
    public  String updateUserState(@RequestParam("id") Integer id,@RequestParam("state") Boolean state){
        int i = userDao.updateState(id, state);
        System.out.println(1);
        return i>0?"success":"error";
    }
    @RequestMapping("/addUser")
    public String addUser(@RequestBody User user){
        user.setRole("普通用户");
        user.setState(false);
        int i = userDao.addUser(user);
        return i>0?"success":"error";
    }
    @RequestMapping("/deleteUser")
    public String deleteUser(int id){
        int i = userDao.deleteUser(id);
        return i>0?"success":"error";
    }
    @RequestMapping("/getupdate")
    public String getUpdateUser(int id){
        User user = userDao.getUpdateUser(id);
        String string = JSON.toJSONString(user);
        return string;
    }
    @RequestMapping("/edituser")
    public String editUser(@RequestBody User user){
        int i = userDao.editUser(user);
        return i>0?"success":"error";
    }
}
