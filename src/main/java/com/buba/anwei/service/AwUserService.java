package com.buba.anwei.service;

import com.buba.anwei.pojo.AwRes;
import com.buba.anwei.pojo.AwUser;

import java.util.List;

public interface AwUserService {
    /**
     * 登录
     * @param phone
     * @return
     */
    AwUser dl(String phone);

    /**
     * 查询权限
     * @param roleId
     * @return
     */
    List<AwRes> loading_res(Integer roleId);
    /**
     * 服务商注册
     * @param awUser
     * @return
     */
    boolean fwszhuce(AwUser awUser);

    boolean cszhuce(AwUser awUser);
}
