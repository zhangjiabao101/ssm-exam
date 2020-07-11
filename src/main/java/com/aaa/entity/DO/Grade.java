package com.aaa.entity.DO;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Grade implements Serializable {

  private Long gId;
  private String gName;
  private String address;
  @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
  @JSONField (format="yyyy-MM-dd'T'HH:mm")
  private Date createDate;


  public Long getgId() {
    return gId;
  }

  public void setgId(Long gId) {
    this.gId = gId;
  }


  public String getgName() {
    return gName;
  }

  public void setgName(String gName) {
    this.gName = gName;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

}
