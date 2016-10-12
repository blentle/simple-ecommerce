package top.melody.ecommerce.platform.handler.enums;


import top.melody.ecommerce.common.util.JsonMapper;

import java.io.Serializable;
import java.util.List;

/**
 * 返回结果类
 * 主要用于ajax返回对象通过JsonBinder.buildNonNullBinder().toJson(resultMsg)返回
 *
 * @author xinzhao
 */
public class ResultMsg implements Serializable{

    /**
     * 成功状态码
     */
    public static final String CODE_S = "1";
    public static final String CODE_HAS = "2";
    /**
     * 失败状态码
     */
    public static final String CODE_E = "0";

    public static final String CODE_NOT_LOGIN = "-1";

    /**
     * 状态码
     */
    public String statusCode = ResultMsg.CODE_E;

    /**
     * 返回结果描述
     */
    public String msg = null;

    /**
     * 返回结果
     */
    private Object result;

    public ResultMsg() {
        super();
    }

    public ResultMsg(String statusCode) {
        super();
        this.statusCode = statusCode;
    }

    public ResultMsg(String statusCode, String msg) {
        super();
        this.statusCode = statusCode;
        this.msg = msg;
    }

    public ResultMsg(String statusCode, String msg, List result) {
        super();
        this.statusCode = statusCode;
        this.msg = msg;
        this.result = result;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }

    public static ResultMsg fromJson(String jsonString) {
        return JsonMapper.nonEmptyMapper().fromJson(jsonString,ResultMsg.class);
    }

}
