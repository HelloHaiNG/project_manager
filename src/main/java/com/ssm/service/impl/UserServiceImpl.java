package com.ssm.service.impl;

import com.ssm.mapper.UserMapper;
import com.ssm.pojo.PageBean;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/18 10:06
 */
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User findUserByUsernameAndPassword(User user) throws Exception {
        return userMapper.findUserByUsernameAndPassword(user);
    }

    @Override
    public User findUserByUsername(String username) throws Exception {
        return userMapper.findUserByUsername(username);
    }

    @Override
    public void addUser(User user) throws Exception {
        userMapper.addUser(user);
    }

    @Override
    public void updateUser(User user) throws Exception {
        userMapper.updateUser(user);
    }

    @Override
    public List<User> queryUser(PageBean pageBean) throws Exception {
        return userMapper.queryUser(pageBean);
    }

    @Override
    public int findUserCount() throws Exception {
        return userMapper.findUserCount();
    }

    @Override
    public void deleteUserByUid(Integer uid) throws Exception {
        userMapper.deleteUserByUid(uid);
    }
}
