package com.aaa.entity.DTO;

import com.aaa.entity.DO.Student;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * @author 张家宝
 * @date 2020-07-03
 */
public class StudentAndGrade extends Student {
    private Long gId;
    private String gName;
    private String address;
    private Date createDate;
    private List<Student> students;

    @Override
    public Long getgId() {
        return gId;
    }

    @Override
    public void setgId(Long gId) {
        this.gId = gId;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
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

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    @Override
    public String toString() {
        return "StudentAndGrade{" + "id=" + gId + ", name='" + gName + '\'' + ", address='" + address + '\''
            + ", createDate=" + createDate + ", students=" + students + '}';
    }
}
