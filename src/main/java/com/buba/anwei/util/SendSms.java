package com.buba.anwei.util;


import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;


public class SendSms {
    public static boolean sendMSM(String phone,String code) {
        boolean boo=false;
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4FxG1bsjXTL62YPPhX2p", "qWeOghus8H9N3ZF7Q4gTIJ5Pcv6Oo3");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", phone);
        request.putQueryParameter("SignName", "\u6570\u636e\u4e91");
        request.putQueryParameter("TemplateCode", "SMS_184816539");
        request.putQueryParameter("TemplateParam", "{\"code\":"+code+"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            int i=response.getHttpStatus();
            if(i==200){
                boo=true;
            }
            System.out.println(response.getData());
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return boo;
    }
}
