package com.ssm.pojo;

import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/24 15:00
 */
public class ProjectQueryVo {
    private PageBean pageBean;
    private ProjectCustom projectCustom;
    private List<ProjectCustom> projectCustoms;

    public List<ProjectCustom> getProjectCustoms() {
        return projectCustoms;
    }

    public void setProjectCustoms(List<ProjectCustom> projectCustoms) {
        this.projectCustoms = projectCustoms;
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public ProjectCustom getProjectCustom() {
        return projectCustom;
    }

    public void setProjectCustom(ProjectCustom projectCustom) {
        this.projectCustom = projectCustom;
    }
}
