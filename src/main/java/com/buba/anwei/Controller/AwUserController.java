package com.buba.anwei.Controller;

import com.buba.anwei.pojo.AwRes;
import com.buba.anwei.pojo.AwUser;
import com.buba.anwei.service.AwUserService;
import com.buba.anwei.util.SendSms;
import com.buba.anwei.util.VerifyCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class AwUserController {
    @Autowired
    private AwUserService awUserService;
    @RequestMapping("authImage")
    public void authImage(HttpServletResponse response, HttpSession session) throws IOException {
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires",0);
        response.setContentType("image/jpeg");
        String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        session.removeAttribute("verCode");
        session.setAttribute("verCode",verifyCode.toLowerCase());
        int w=100,h=30;
        VerifyCodeUtils.outputImage(w,h,response.getOutputStream(),verifyCode);
    }

    //登录
    @RequestMapping("/dl")
    @ResponseBody
    public Map<String,String> UserLogin(String phone, String password, HttpSession session, HttpServletRequest request){
        Map<String,String> map = new HashMap<String,String>();
        String verCode = (String)session.getAttribute("verCode");
        AwUser user = awUserService.dl(phone);
        if(user==null){
            map.put("message","用户不存在，请注册再次登录");
            return map;
        }
        if(!user.getPassword().equals(password)){
            map.put("message","密码不正确请重新输入");
            return map;
        }

        session.setAttribute("USER_SESSION",user);
        map.put("flag","true");

        return map;
    }
    @RequestMapping("/loading_res")
    @ResponseBody
    public List<AwRes> loading_res(HttpSession session){
        AwUser user = (AwUser)session.getAttribute("USER_SESSION");

        List<AwRes> list = awUserService.loading_res(user.getRoleId());

        return list;
    }

    @RequestMapping("yanzhengma")
    @ResponseBody
    public boolean yanzhengma(String codestext,HttpSession session){
        System.out.println(codestext);
        String  verCode =(String) session.getAttribute("verCode");
        if(codestext.equals(verCode)){
            return true;
        }else{
            return false;
        }
    }

    //    生成验证码
    @RequestMapping("/fasong")
    @ResponseBody
    public boolean getmobileCode(HttpSession session ,String phone) {

            boolean b=false;
            //生成随机4位数验证码
            int code = (int) ((Math.random() * 9 + 1) * 1000);
            //将int 转换成 string
            String pCode = String.valueOf(code);
            session.setAttribute("telCode",pCode);
            System.out.println(pCode);
            System.out.println(pCode);
            System.out.println(pCode);
            System.out.println(pCode);
            b = SendSms.sendMSM(phone, pCode);

            return b;
    }

    @RequestMapping("/verifyMobileCode")
    @ResponseBody
    public Boolean verifyMobileCode(String code,HttpSession session) {

        String code1 = (String) session.getAttribute("telCode");
        //进行判断
        if (code.equals(code1)) {
            return true;
        }
        return false;
    }

    @RequestMapping("/logout")
    public String  logout(HttpSession session){
        //根据键删除session中的值
        session.removeAttribute("USER_SESSION");

        session.invalidate();

        return "redirect:/jsps/login.jsp";

    }
    @RequestMapping("/fwszhuce")
    @ResponseBody
    public boolean  fwszhuce(AwUser awUser){
        boolean a=awUserService.fwszhuce(awUser);
        return  a;

    }
    @RequestMapping("/cszhuce")
    @ResponseBody
    public boolean  cszhuce(AwUser awUser){
        boolean a=awUserService.cszhuce(awUser);
        return  a;

    }

}
