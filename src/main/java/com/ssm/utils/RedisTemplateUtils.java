package com.ssm.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import java.util.List;

/**
 * @author liaohong
 * @date 2018/7/27 15:39
 */
public class RedisTemplateUtils {

    private RedisTemplate redisTemplate;

    public void addList(String key,Object object) {
        redisTemplate.opsForList().set(key,0,object);
    }

    public void list() {
        List<Object> objectList = redisTemplate.opsForList().range("loginUser",0,-1);
    }

    public boolean isContainList(String key, Object object) {
        List<Object> objectList = redisTemplate.opsForList().range(key, 0, -1);
        if (objectList != null && objectList.contains(object)) {
            return true;
        }
        return false;
    }
}
