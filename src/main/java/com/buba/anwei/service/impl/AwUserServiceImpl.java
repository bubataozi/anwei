package com.buba.anwei.service.impl;

import com.buba.anwei.dao.AwUserMapper;
import com.buba.anwei.pojo.AwRes;
import com.buba.anwei.pojo.AwUser;
import com.buba.anwei.service.AwUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class AwUserServiceImpl implements AwUserService {
    @Autowired
    private AwUserMapper awUserMapper;

    @Override
    public AwUser dl(String phone) {
        return awUserMapper.dl(phone);
    }

    @Override
    public List<AwRes> loading_res(Integer roleId) {
        List<AwRes> list = awUserMapper.loading_res(roleId);

        List<AwRes> resList= new ArrayList<AwRes>();

        for (AwRes res:list) {
            if(res.getParentId()==0){
                List<AwRes> resChildList= new ArrayList<AwRes>();
                for (int i = 0; i < list.size(); i++) {
                    if(list.get(i).getParentId()==res.getId()){
                        resChildList.add(list.get(i));
                    }
                }
                res.setResList(resChildList);
                resList.add(res);
            }
        }

        return resList;
    }

   @Transactional
    public boolean fwszhuce(AwUser awUser) {
        boolean b=false;
        boolean a=awUserMapper.adduser(awUser);
        if(a){
            b=awUserMapper.adduser_role(awUser.getId(),3);
        }
        return b;
    }

    @Override
    public boolean cszhuce(AwUser awUser) {
        boolean b=false;
        boolean a=awUserMapper.adduser(awUser);
        if(a){
            b=awUserMapper.adduser_role(awUser.getId(),2);
        }
        return b;
    }
}
