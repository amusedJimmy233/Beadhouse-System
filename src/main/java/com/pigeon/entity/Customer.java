package com.pigeon.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class Customer {
    private String CName;
    private String Sex;
    private int Age;
    private String Identity;
    private String Health;
    private String Family;
    private String FamilyPhone;
    private String State;
    private int Room;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date StartTime;
    private String StartRemarks;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ExpireTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date EndTime;
    private String EndSort;
    private String EndReason;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date EndAppTime;
    private String EndState;
    private String EndRemarks;

    @Override
    public String toString() {
        return "Customer{" +
                "CName='" + CName + '\'' +
                ", Sex='" + Sex + '\'' +
                ", Age=" + Age +
                ", Identity='" + Identity + '\'' +
                ", Health='" + Health + '\'' +
                ", Family='" + Family + '\'' +
                ", FamilyPhone='" + FamilyPhone + '\'' +
                ", State='" + State + '\'' +
                ", Room=" + Room +
                ", StartTime=" + StartTime +
                ", StartRemarks='" + StartRemarks + '\'' +
                ", ExpireTime=" + ExpireTime +
                ", EndTime=" + EndTime +
                ", EndSort='" + EndSort + '\'' +
                ", EndReason='" + EndReason + '\'' +
                ", EndAppTime=" + EndAppTime +
                ", EndState='" + EndState + '\'' +
                ", EndRemarks='" + EndRemarks + '\'' +
                '}';
    }

    public Customer(String CName, String sex, int age, String identity, String health, String family, String familyPhone, String state, int room, Date startTime, String startRemarks, Date expireTime, Date endTime, String endSort, String endReason, Date endAppTime, String endState, String endRemarks) {
        this.CName = CName;
        Sex = sex;
        Age = age;
        Identity = identity;
        Health = health;
        Family = family;
        FamilyPhone = familyPhone;
        State = state;
        Room = room;
        StartTime = startTime;
        StartRemarks = startRemarks;
        ExpireTime = expireTime;
        EndTime = endTime;
        EndSort = endSort;
        EndReason = endReason;
        EndAppTime = endAppTime;
        EndState = endState;
        EndRemarks = endRemarks;
    }

    public String getCName() {
        return CName;
    }

    public void setCName(String CName) {
        this.CName = CName;
    }

    public String getSex() {
        return Sex;
    }

    public void setSex(String sex) {
        Sex = sex;
    }

    public int getAge() {
        return Age;
    }

    public void setAge(int age) {
        Age = age;
    }

    public String getIdentity() {
        return Identity;
    }

    public void setIdentity(String identity) {
        Identity = identity;
    }

    public String getHealth() {
        return Health;
    }

    public void setHealth(String health) {
        Health = health;
    }

    public String getFamily() {
        return Family;
    }

    public void setFamily(String family) {
        Family = family;
    }

    public String getFamilyPhone() {
        return FamilyPhone;
    }

    public void setFamilyPhone(String familyPhone) {
        FamilyPhone = familyPhone;
    }

    public String getState() {
        return State;
    }

    public void setState(String state) {
        State = state;
    }

    public int getRoom() {
        return Room;
    }

    public void setRoom(int room) {
        Room = room;
    }

    public Date getStartTime() {
        return StartTime;
    }

    public void setStartTime(Date startTime) {
        StartTime = startTime;
    }

    public String getStartRemarks() {
        return StartRemarks;
    }

    public void setStartRemarks(String startRemarks) {
        StartRemarks = startRemarks;
    }

    public Date getExpireTime() {
        return ExpireTime;
    }

    public void setExpireTime(Date expireTime) {
        ExpireTime = expireTime;
    }

    public Date getEndTime() {
        return EndTime;
    }

    public void setEndTime(Date endTime) {
        EndTime = endTime;
    }

    public String getEndSort() {
        return EndSort;
    }

    public void setEndSort(String endSort) {
        EndSort = endSort;
    }

    public String getEndReason() {
        return EndReason;
    }

    public void setEndReason(String endReason) {
        EndReason = endReason;
    }

    public Date getEndAppTime() {
        return EndAppTime;
    }

    public void setEndAppTime(Date endAppTime) {
        EndAppTime = endAppTime;
    }

    public String getEndState() {
        return EndState;
    }

    public void setEndState(String endState) {
        EndState = endState;
    }

    public String getEndRemarks() {
        return EndRemarks;
    }

    public void setEndRemarks(String endRemarks) {
        EndRemarks = endRemarks;
    }

    public Customer() {
    }
}
