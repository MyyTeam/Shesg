package com.myyteam.shesg.utils;

import cn.hutool.core.util.StrUtil;
import com.myyteam.shesg.common.Constants;

import java.util.Random;

public class GateUtil {

    /**
     * 自定义进制（选择你想要的进制数，不能重复且最好不要0、1这些容易混淆的字符）
     */
    private static final char[] KEYS = new char[]{'q', 'w', 'D', 'e', 'U', '8', 'M', 'X', 's', 'C', 'K', '2', 'J', 'd', 'T', 'z', 'R', 'Q', 'x', '9', 'c', 'F', '7', 'p', 'Y', '5', 'N', 'Z', 'k', 'H', '3', 'm', 'E', 'j', 'W', 'u', 'f', 'V', 'r', '4', 'v', 'B', 'y', 't', 'n', '6', 'G', 'b', 'P', 'g', 'S', 'h'};

    /**
     * 定义一个字符用来补全邀请码长度（该字符前面是计算出来的邀请码，后面是用来补全用的）
     */
    private static final char COMPLETION_CHARACTERS = 'a';

    /**
     * 进制长度
     */
    private static final int BINLEN = KEYS.length;

    /**
     * 邀请码长度
     */
    private static final int SHARECODE_LENGTH = 9;

    public static String getDhgateImageUrl(String url) {
        // 给图片补全url前缀，敦煌商品详情信息中不带前缀
        String imageUrl = url;
        if (StrUtil.isNotBlank(imageUrl)) {
            String souLve = "";
            if (StrUtil.startWith(imageUrl, "f2/")) {
                souLve = "300x300/";
            }
            imageUrl = Constants.GATE_IMAGE_PRE + souLve + imageUrl;
        }
        return imageUrl;
    }

    /**
     * 根据ID生成随机码
     *
     * @param id ID
     * @return 随机码
     */
    public static String toSerialCode(long id) {
        char[] buf = new char[32];
        int charPos = 32;

        while ((id / BINLEN) > 0) {
            int ind = (int) (id % BINLEN);
            buf[--charPos] = KEYS[ind];
            id /= BINLEN;
        }
        buf[--charPos] = KEYS[(int) (id % BINLEN)];
        String str = new String(buf, charPos, (32 - charPos));
        // 不够长度的自动随机补全
        if (str.length() < SHARECODE_LENGTH) {
            StringBuilder sb = new StringBuilder();
            sb.append(COMPLETION_CHARACTERS);
            for (int i = 1; i < SHARECODE_LENGTH - str.length(); i++) {
                sb.append(KEYS[new Random().nextInt(BINLEN)]);
            }
            str += sb.toString();
        }
        return str;
    }
}
