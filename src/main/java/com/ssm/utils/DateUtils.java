package com.ssm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author liaohong
 * @date 2018/7/24 11:57
 */
public class DateUtils {
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public Date dateFormat(String string){
        try {
            return sdf.parse(string);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
