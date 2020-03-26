package com.buba.anwei.dao;

import com.buba.anwei.pojo.AwRes;
import com.buba.anwei.pojo.AwUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface AwUserMapper {
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

    boolean adduser(AwUser awUser);

    boolean adduser_role(@Param("userId") Integer userId,@Param("roleId") Integer roleId);
}
