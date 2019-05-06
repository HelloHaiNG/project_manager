package com.ssm.mapper;

import com.ssm.pojo.PageBean;
import com.ssm.pojo.Project;
import com.ssm.pojo.ProjectCustom;
import com.ssm.pojo.ProjectQueryVo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/24 11:35
 */
@Repository
public interface ProjectMapper {
    public void addProject(Project project) throws Exception;

    public int findProjectCount() throws Exception;

    public List<ProjectCustom> queryProject(ProjectQueryVo projectQueryVo) throws Exception;

    public int queryProjectLikeCount(String pname) throws Exception;

    public void update(ProjectCustom projectCustom) throws Exception;

}
