package com.ssm.utils;

import org.junit.Test;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
/**
 * @author liaohong
 * @date 2018/7/30 9:34
 */
public class JedisUtils {
    private JedisPool jedisPool = null;
    private String HOST = "10.104.10.14";
    private Integer PORT = 6379;
    private Jedis jedis;

    public JedisUtils() {
        jedisPool = new JedisPool(HOST, PORT);
        jedis = jedisPool.getResource();
    }

    public void sadd(String key, String value) {
        jedis.sadd(key, value);
    }

    public boolean sismember(String key, String value) {
        boolean flag = jedis.sismember(key, value);
        if (flag) {
            return true;
        }
        return false;
    }

    public void srem(String key,String value) {
        jedis.srem(key,value);
    }

    public void del(String key) {
        jedis.del(key);
    }

    @Test
    public void test() {
        jedis.del("user");
        jedis.del("username");
        System.out.println("success");
    }
}
