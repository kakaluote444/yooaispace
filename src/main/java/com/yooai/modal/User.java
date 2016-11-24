package com.yooai.modal;

import java.util.Date;

public class User {
    private Integer userId;

    private String userName;

    private String userPassword;

    private String signature;

    private String userEmail;

    private Integer sex;

    private Date birthday;

    private Integer emotionState;

    private String nowPlace;

    private String hobby;

    private String headIcon;

    private Integer level;

    private Integer vistors;

    private Integer emailEable;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature == null ? null : signature.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getEmotionState() {
        return emotionState;
    }

    public void setEmotionState(Integer emotionState) {
        this.emotionState = emotionState;
    }

    public String getNowPlace() {
        return nowPlace;
    }

    public void setNowPlace(String nowPlace) {
        this.nowPlace = nowPlace == null ? null : nowPlace.trim();
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby == null ? null : hobby.trim();
    }

    public String getHeadIcon() {
        return headIcon;
    }

    public void setHeadIcon(String headIcon) {
        this.headIcon = headIcon == null ? null : headIcon.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getVistors() {
        return vistors;
    }

    public void setVistors(Integer vistors) {
        this.vistors = vistors;
    }

    public Integer getEmailEable() {
        return emailEable;
    }

    public void setEmailEable(Integer emailEable) {
        this.emailEable = emailEable;
    }
}