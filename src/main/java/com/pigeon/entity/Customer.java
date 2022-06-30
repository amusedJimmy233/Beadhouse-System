package com.pigeon.entity;

public class Customer {
    private int Cid;
    private String CName;
    private String Sex;
    private int Age;
    private String Identity;
    private String Health;
    private String Family;
    private String FamilyPhone;
    private String State;
    private int Room;
    private String StartTime;
    private String StartRemarks;
    private String ExpireTime;
    private String EndTime;
    private String EndSort;
    private String EndReason;
    private String EndAppTime;
    private String EndState;
    private String EndRemarks;
    private String OutTime;
    private String ExpectBackTime;
    private String BackTime;
    private String Companion;
    private String CompanionPhone;
    private String CompanionRelationship;
    private String OutState;
    private String OutSort;
    private String OutRemarks;
    private String OutAppTime;

    @Override
    public String toString() {
        return "Customer{" +
                "Cid=" + Cid +
                ", CName='" + CName + '\'' +
                ", Sex='" + Sex + '\'' +
                ", Age=" + Age +
                ", Identity='" + Identity + '\'' +
                ", Health='" + Health + '\'' +
                ", Family='" + Family + '\'' +
                ", FamilyPhone='" + FamilyPhone + '\'' +
                ", State='" + State + '\'' +
                ", Room=" + Room +
                ", StartTime='" + StartTime + '\'' +
                ", StartRemarks='" + StartRemarks + '\'' +
                ", ExpireTime='" + ExpireTime + '\'' +
                ", EndTime='" + EndTime + '\'' +
                ", EndSort='" + EndSort + '\'' +
                ", EndReason='" + EndReason + '\'' +
                ", EndAppTime='" + EndAppTime + '\'' +
                ", EndState='" + EndState + '\'' +
                ", EndRemarks='" + EndRemarks + '\'' +
                ", OutTime='" + OutTime + '\'' +
                ", ExpectBackTime='" + ExpectBackTime + '\'' +
                ", BackTime='" + BackTime + '\'' +
                ", Companion='" + Companion + '\'' +
                ", CompainionPhone='" + CompanionPhone + '\'' +
                ", CompanionRelationship='" + CompanionRelationship + '\'' +
                ", OutState='" + OutState + '\'' +
                ", OutSort='" + OutSort + '\'' +
                ", OutRemarks='" + OutRemarks + '\'' +
                ", OutAppTime='" + OutAppTime + '\'' +
                '}';
    }

    public Customer(int cid, String CName, String sex, int age, String identity, String health, String family, String familyPhone, String state, int room, String startTime, String startRemarks, String expireTime, String endTime, String endSort, String endReason, String endAppTime, String endState, String endRemarks, String outTime, String expectBackTime, String backTime, String companion, String compainionPhone, String companionRelationship, String outState, String outSort, String outRemarks, String outAppTime) {
        Cid = cid;
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
        OutTime = outTime;
        ExpectBackTime = expectBackTime;
        BackTime = backTime;
        Companion = companion;
        CompanionPhone = compainionPhone;
        CompanionRelationship = companionRelationship;
        OutState = outState;
        OutSort = outSort;
        OutRemarks = outRemarks;
        OutAppTime = outAppTime;
    }

    public int getCid() {
        return Cid;
    }

    public void setCid(int cid) {
        Cid = cid;
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

    public String getStartTime() {
        return StartTime;
    }

    public void setStartTime(String startTime) {
        StartTime = startTime;
    }

    public String getStartRemarks() {
        return StartRemarks;
    }

    public void setStartRemarks(String startRemarks) {
        StartRemarks = startRemarks;
    }

    public String getExpireTime() {
        return ExpireTime;
    }

    public void setExpireTime(String expireTime) {
        ExpireTime = expireTime;
    }

    public String getEndTime() {
        return EndTime;
    }

    public void setEndTime(String endTime) {
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

    public String getEndAppTime() {
        return EndAppTime;
    }

    public void setEndAppTime(String endAppTime) {
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

    public String getOutTime() {
        return OutTime;
    }

    public void setOutTime(String outTime) {
        OutTime = outTime;
    }

    public String getExpectBackTime() {
        return ExpectBackTime;
    }

    public void setExpectBackTime(String expectBackTime) {
        ExpectBackTime = expectBackTime;
    }

    public String getBackTime() {
        return BackTime;
    }

    public void setBackTime(String backTime) {
        BackTime = backTime;
    }

    public String getCompanion() {
        return Companion;
    }

    public void setCompanion(String companion) {
        Companion = companion;
    }

    public String getCompanionPhone() {
        return CompanionPhone;
    }

    public void setCompanionPhone(String compainionPhone) {
        CompanionPhone = compainionPhone;
    }

    public String getCompanionRelationship() {
        return CompanionRelationship;
    }

    public void setCompanionRelationship(String companionRelationship) {
        CompanionRelationship = companionRelationship;
    }

    public String getOutState() {
        return OutState;
    }

    public void setOutState(String outState) {
        OutState = outState;
    }

    public String getOutSort() {
        return OutSort;
    }

    public void setOutSort(String outSort) {
        OutSort = outSort;
    }

    public String getOutRemarks() {
        return OutRemarks;
    }

    public void setOutRemarks(String outRemarks) {
        OutRemarks = outRemarks;
    }

    public String getOutAppTime() {
        return OutAppTime;
    }

    public void setOutAppTime(String outAppTime) {
        OutAppTime = outAppTime;
    }
}
