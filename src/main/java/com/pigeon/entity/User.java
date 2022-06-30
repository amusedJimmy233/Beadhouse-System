package com.pigeon.entity;

public class User {
    private String Username;
    private String Password;

    @Override
    public String toString() {
        return "User{" +
                "Username='" + Username + '\'' +
                ", Password='" + Password + '\'' +
                '}';
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public User(String username, String password) {
        Username = username;
        Password = password;
    }

    public User() {
    }
}
