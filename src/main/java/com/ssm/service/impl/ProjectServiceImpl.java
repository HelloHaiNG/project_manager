package com.ssm.service.impl;

import com.ssm.mapper.ProjectMapper;
import com.ssm.pojo.PageBean;
import com.ssm.pojo.Project;
import com.ssm.pojo.ProjectCustom;
import com.ssm.pojo.ProjectQueryVo;
import com.ssm.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/24 11:39
 */
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectMapper projectMapper;
    @Override
    public void addProject(Project project) throws Exception {
        projectMapper.addProject(project);
    }

    @Override
    public int findProjectCount() throws Exception {
        return projectMapper.findProjectCount();
    }

    @Override
    public List<ProjectCustom> queryProject(ProjectQueryVo projectQueryVo) throws Exception {
        return projectMapper.queryProject(projectQueryVo);
    }

    @Override
    public int queryProjectLikeCount(String pname) throws Exception {
        return projectMapper.queryProjectLikeCount(pname);
    }

    @Override
    public void update(ProjectCustom projectCustom) throws Exception {
        projectMapper.update(projectCustom);
    }

}
