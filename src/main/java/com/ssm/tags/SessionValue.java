package com.ssm.tags;

import com.ssm.utils.SessionMap;
import org.apache.commons.lang3.StringUtils;

/**
 * @author liaohong
 * @date 2018/7/18 16:41
 */
public class SessionValue  {
    public static Object getSession(String key){
        Object value = null;
        if (StringUtils.isNotBlank(key)) {
            value = SessionMap.get(key);
        }
        return value;
    }
}
