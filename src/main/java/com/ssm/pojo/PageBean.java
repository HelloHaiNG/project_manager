package com.ssm.pojo;

import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/18 13:44
 */
public class PageBean {
    //当前页
    private Integer currentPage;
    //总记录数
    private Integer totalCount;
    //总页数
    private Integer totalPage;
    //开始位置
    private Integer begin;
    //每页的记录数
    private Integer pageSize;
    private List<User> userList;
    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getBegin() {
        return begin;
    }

    public void setBegin(Integer begin) {
        this.begin = begin;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
}
