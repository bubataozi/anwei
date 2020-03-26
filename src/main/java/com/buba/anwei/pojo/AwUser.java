package com.buba.anwei.pojo;


import java.util.Date;

public class AwUser {

  private Integer id;
  private String userName;
  private String password;
  private Integer sex;
  private String phone;
  private String email;
  private Date createTime;
  private Integer roleId;

  public AwUser() {
  }

  public AwUser(Integer id, String userName, String password, Integer sex, String phone, String email, Date createTime, Integer roleId) {
    this.id = id;
    this.userName = userName;
    this.password = password;
    this.sex = sex;
    this.phone = phone;
    this.email = email;
    this.createTime = createTime;
    this.roleId = roleId;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Integer getSex() {
    return sex;
  }

  public void setSex(Integer sex) {
    this.sex = sex;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public Date getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Date createTime) {
    this.createTime = createTime;
  }

  public Integer getRoleId() {
    return roleId;
  }

  public void setRoleId(Integer roleId) {
    this.roleId = roleId;
  }

  @Override
  public String toString() {
    return "AwUser{" +
            "id=" + id +
            ", userName='" + userName + '\'' +
            ", password='" + password + '\'' +
            ", sex=" + sex +
            ", phone='" + phone + '\'' +
            ", email='" + email + '\'' +
            ", createTime=" + createTime +
            ", roleId=" + roleId +
            '}';
  }
}
