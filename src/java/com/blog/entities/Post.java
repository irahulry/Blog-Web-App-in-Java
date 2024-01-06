/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author Lenovo
 */
public class Post {
    private int id;
    private String title;
    private String content;
    private String code;
    private String pic;
    private Timestamp date;
    private int catId;
    private int userId;

    public Post() {
    }

    public Post(int id, String title, String content, String code, String pic, Timestamp date, int catId,int userId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }

    public Post(String title, String content, String code, String pic, Timestamp date, int catId,int userId) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.date = date;
        this.catId = catId;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
    
}
