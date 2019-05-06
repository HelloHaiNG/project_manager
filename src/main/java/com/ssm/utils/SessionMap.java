package com.ssm.utils;

import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author liaohong
 * @date 2018/7/18 17:23
 */
public class SessionMap {

    private static Map<String, Object> sessionMap = new ConcurrentHashMap<String, Object>();

    public static void put(String key, Object value) {
        sessionMap.put(key, value);
    }

    public static Object get(String key) {
        return sessionMap.get(key);
    }

    public static void remove() {
        Iterator<String> iterator = sessionMap.keySet().iterator();
        while (iterator.hasNext()) {
            String key = iterator.next();
            sessionMap.remove(key);
        }
    }
}
