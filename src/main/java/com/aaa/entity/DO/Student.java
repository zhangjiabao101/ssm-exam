package com.aaa.entity.DO;

import java.io.Serializable;

public class Student implements Serializable {

  private Long sId;
  private String sName;
  private Short age;
  private String phone;
  private String home;
  private Long gId;

  public Long getsId() {
    return sId;
  }

  public void setsId(Long sId) {
    this.sId = sId;
  }

  public String getsName() {
    return sName;
  }

  public void setsName(String sName) {
    this.sName = sName;
  }

  public Short getAge() {
    return age;
  }

  public void setAge(Short age) {
    this.age = age;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getHome() {
    return home;
  }

  public void setHome(String home) {
    this.home = home;
  }

  public Long getgId() {
    return gId;
  }

  public void setgId(Long gId) {
    this.gId = gId;
  }

  @Override
  public String toString() {
    return "Student{" + "id=" + sId + ", name='" + sName + '\'' + ", age=" + age + ", phone='" + phone + '\'' + ", home='"
        + home + '\'' + ", gId=" + gId + '}';
  }
}
