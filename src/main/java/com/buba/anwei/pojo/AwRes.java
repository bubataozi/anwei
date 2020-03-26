package com.buba.anwei.pojo;


import javax.xml.crypto.Data;
import java.util.List;

public class AwRes {

  private Integer id;
  private String icon;
  private String info;
  private String resName;
  private String type;
  private Integer parentId;
  private Integer disabled;
  private Data createtime;
  private List<AwRes> resList;

  public AwRes() {
  }

  public AwRes(Integer id, String icon, String info, String resName, String type, Integer parentId, Integer disabled, Data createtime, List<AwRes> resList) {
    this.id = id;
    this.icon = icon;
    this.info = info;
    this.resName = resName;
    this.type = type;
    this.parentId = parentId;
    this.disabled = disabled;
    this.createtime = createtime;
    this.resList = resList;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getIcon() {
    return icon;
  }

  public void setIcon(String icon) {
    this.icon = icon;
  }

  public String getInfo() {
    return info;
  }

  public void setInfo(String info) {
    this.info = info;
  }

  public String getResName() {
    return resName;
  }

  public void setResName(String resName) {
    this.resName = resName;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public Integer getParentId() {
    return parentId;
  }

  public void setParentId(Integer parentId) {
    this.parentId = parentId;
  }

  public Integer getDisabled() {
    return disabled;
  }

  public void setDisabled(Integer disabled) {
    this.disabled = disabled;
  }

  public Data getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Data createtime) {
    this.createtime = createtime;
  }

  public List<AwRes> getResList() {
    return resList;
  }

  public void setResList(List<AwRes> resList) {
    this.resList = resList;
  }

  @Override
  public String toString() {
    return "AwRes{" +
            "id=" + id +
            ", icon='" + icon + '\'' +
            ", info='" + info + '\'' +
            ", resName='" + resName + '\'' +
            ", type='" + type + '\'' +
            ", parentId=" + parentId +
            ", disabled=" + disabled +
            ", createtime=" + createtime +
            ", resList=" + resList +
            '}';
  }
}
