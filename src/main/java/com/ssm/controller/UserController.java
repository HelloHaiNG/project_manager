package com.ssm.controller;

import com.ssm.pojo.PageBean;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import com.ssm.utils.JedisUtils;
import com.ssm.utils.SessionMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/18 10:16
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    private JedisUtils jedisUtils = new JedisUtils();

    @RequestMapping("/login")
    public ModelAndView login(User user) throws Exception {
        User user1 = userService.findUserByUsernameAndPassword(user);
        ModelAndView modelAndView = new ModelAndView();
        if (user1 != null) {
            SessionMap.put("user", user1);
            modelAndView.setViewName("/index.jsp");
        } else {
            modelAndView.setViewName("/login.jsp");
        }
        return modelAndView;
    }

    @RequestMapping("/findUserByUsername")
    public void findUserByUsername(HttpServletResponse response, String username) throws Exception {
        boolean flag = jedisUtils.sismember("username", username);
        if (flag) {
            System.out.println("没有查询数据库");
            response.getWriter().write("yes");
        } else {
            System.out.println("查询了数据库");
            User user = userService.findUserByUsername(username);
            if (user != null) {
                response.getWriter().write("yes");
            } else {
                response.getWriter().write("no");
            }
        }
    }

    @RequestMapping("/add")
    public ModelAndView add(User user) throws Exception {
        userService.addUser(user);
        jedisUtils.sadd("username", user.getUsername());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/jsp/success.jsp");
        return modelAndView;
    }

    @RequestMapping("/update")
    public ModelAndView update(User user) throws Exception {
        jedisUtils.srem("username", user.getUsername());
        userService.updateUser(user);
        jedisUtils.sadd("username", user.getUsername());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/jsp/success.jsp");
        return modelAndView;
    }

    @RequestMapping("/list")
    public ModelAndView list(Integer currentPage) throws Exception {
        PageBean pageBean = new PageBean();
        int totalCount = userService.findUserCount();
        int pageSize = 5;
        int totalPage;
        int begin = (currentPage - 1) * pageSize;
        if (totalCount % 5 == 0) {
            totalPage = totalCount / 5;
        } else {
            totalPage = totalCount / 5 + 1;
        }
        pageBean.setBegin(begin);
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);
        List<User> userList = userService.queryUser(pageBean);
        pageBean.setUserList(userList);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageBean", pageBean);
        modelAndView.setViewName("/jsp/user/list.jsp");
        return modelAndView;
    }

    @RequestMapping("/delete")
    public String delete(Integer uid) throws Exception {
        userService.deleteUserByUid(uid);
        return "forward:list.action?currentPage=1";
    }

    @RequestMapping("/deleteSome")
    public String deleteSome(Integer[] uid) throws Exception {
        if (uid.length != 0) {
            for (Integer id : uid) {
                userService.deleteUserByUid(id);
            }
        }
        return "forward:list.action?currentPage=1";
    }

    @RequestMapping("/exit")
    public void exit() {
        User user = (User) SessionMap.get("user");
        //正常开发
        jedisUtils.srem("user", user.getUsername());
        SessionMap.remove();
//        WebDriver driver = new ChromeDriver();
//        driver.close();
        //测试
//        jedisUtils.del("user");
//        jedisUtils.del("username");
    }

}
