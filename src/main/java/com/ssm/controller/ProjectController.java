package com.ssm.controller;

import com.ssm.pojo.PageBean;
import com.ssm.pojo.Project;
import com.ssm.pojo.ProjectCustom;
import com.ssm.pojo.ProjectQueryVo;
import com.ssm.service.ProjectService;
import com.ssm.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/24 11:42
 */
@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @RequestMapping("/add")
    public String add(String uid, String pname, String pdetail, @RequestParam(value = "ptime") String time) throws Exception {
        DateUtils dateUtils = new DateUtils();
        Date ptime = dateUtils.dateFormat(time);
        Project project = new Project();
        project.setPdetail(pdetail);
        project.setPname(pname);
        project.setPtime(ptime);
        project.setUid(Integer.parseInt(uid));
        projectService.addProject(project);
        return "forward:/jsp/success.jsp";
    }

    @RequestMapping("/list")
    public String list(String pname, Integer currentPage, HttpServletRequest request) throws Exception {
        ProjectQueryVo projectQueryVo = new ProjectQueryVo();
        ProjectCustom projectCustom = new ProjectCustom();
        int totalCount = 0;
        if (pname == null) {
            totalCount = projectService.findProjectCount();
        } else {
            projectCustom.setPname(pname);
            projectQueryVo.setProjectCustom(projectCustom);
            totalCount = projectService.queryProjectLikeCount(projectQueryVo.getProjectCustom().getPname());
        }
        PageBean pageBean = new PageBean();
        int pageSize = 10;
        int totalPage;
        int begin = (currentPage - 1) * pageSize;
        if (totalCount % 10 == 0) {
            totalPage = totalCount / 10;
        } else {
            totalPage = totalCount / 10 + 1;
        }
        pageBean.setBegin(begin);
        pageBean.setCurrentPage(currentPage);
        pageBean.setPageSize(pageSize);
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage(totalPage);
        projectQueryVo.setPageBean(pageBean);
        List<ProjectCustom> projectCustoms = projectService.queryProject(projectQueryVo);
        request.setAttribute("projectCustoms", projectCustoms);
        request.setAttribute("pageBean", pageBean);
        request.setAttribute("projectCustom", projectQueryVo.getProjectCustom());
        return "/jsp/project/list.jsp";
    }

    @RequestMapping("/update")
    public String update(ProjectQueryVo projectQueryVo) throws Exception {
        List<ProjectCustom> projectCustoms = projectQueryVo.getProjectCustoms();
        for (ProjectCustom projectCustom : projectCustoms) {
            projectService.update(projectCustom);
        }
        return "forward:/jsp/success.jsp";
    }
}
