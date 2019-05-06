package com.ssm.service;

import com.ssm.pojo.PageBean;
import com.ssm.pojo.User;

import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/18 10:06
 */
public interface UserService {
    public User findUserByUsernameAndPassword(User user) throws Exception;

    public User findUserByUsername(String username) throws Exception;

    public void addUser(User user) throws Exception;

    public void updateUser(User user) throws Exception;

    public List<User> queryUser(PageBean pageBean) throws Exception;

    public int findUserCount() throws Exception;

    public void deleteUserByUid(Integer uid) throws Exception;
}
