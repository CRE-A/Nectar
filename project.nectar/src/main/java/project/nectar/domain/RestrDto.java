package project.nectar.domain;

import java.util.Objects;

public class RestrDto {
    private Integer restr_NUM;
    private String restr_name;
    private double restr_latitude;
    private double restr_longitude;
    private String restr_location;
    private String restr_location_tag;
    private String restr_phone;
    private String restr_time;
    private float restr_star;
    private String restr_foodType;
    private String restr_cost;
    private String restr_parking;
    private String restr_tag;
    private String restr_menu;
    private String restr_desc;
    private String restr_picture;
    private String restr_category_loc;
    private String biz_reg_num;
    private String restr_viewCnt;
    private String restr_reviewCnt;
    private String restr_likeCnt;


    public RestrDto() {
        this("", 0.0, 0.0, "", "", "", "", 3.5f, "", "", "", "", "", "", "", "","");
    }

    public RestrDto(String restr_name, double restr_latitude, double restr_longitude, String restr_location, String restr_location_tag, String restr_phone, String restr_time, float restr_star, String restr_foodType, String restr_cost, String restr_parking, String restr_tag, String restr_menu, String restr_desc, String restr_picture, String restr_category_loc, String biz_reg_num) {
        this.restr_name = restr_name;
        this.restr_latitude = restr_latitude;
        this.restr_longitude = restr_longitude;
        this.restr_location = restr_location;
        this.restr_location_tag = restr_location_tag;
        this.restr_phone = restr_phone;
        this.restr_time = restr_time;
        this.restr_star = restr_star;
        this.restr_foodType = restr_foodType;
        this.restr_cost = restr_cost;
        this.restr_parking = restr_parking;
        this.restr_tag = restr_tag;
        this.restr_menu = restr_menu;
        this.restr_desc = restr_desc;
        this.restr_picture = restr_picture;
        this.restr_category_loc = restr_category_loc;
        this.biz_reg_num = biz_reg_num;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RestrDto restrDto = (RestrDto) o;
        return Double.compare(restrDto.restr_latitude, restr_latitude) == 0 && Double.compare(restrDto.restr_longitude, restr_longitude) == 0 && Objects.equals(restr_NUM, restrDto.restr_NUM) && Objects.equals(restr_name, restrDto.restr_name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(restr_NUM, restr_name, restr_latitude, restr_longitude);
    }

    public Integer getRestr_NUM() {
        return restr_NUM;
    }

    public void setRestr_NUM(Integer restr_NUM) {
        this.restr_NUM = restr_NUM;
    }

    public String getRestr_name() {
        return restr_name;
    }

    public void setRestr_name(String restr_name) {
        this.restr_name = restr_name;
    }

    public double getRestr_latitude() {
        return restr_latitude;
    }

    public void setRestr_latitude(double restr_latitude) {
        this.restr_latitude = restr_latitude;
    }

    public double getRestr_longitude() {
        return restr_longitude;
    }

    public void setRestr_longitude(double restr_longitude) {
        this.restr_longitude = restr_longitude;
    }

    public String getRestr_location() {
        return restr_location;
    }

    public void setRestr_location(String restr_location) {
        this.restr_location = restr_location;
    }

    public String getRestr_location_tag() {
        return restr_location_tag;
    }

    public void setRestr_location_tag(String restr_location_tag) {
        this.restr_location_tag = restr_location_tag;
    }

    public String getRestr_phone() {
        return restr_phone;
    }

    public void setRestr_phone(String restr_phone) {
        this.restr_phone = restr_phone;
    }

    public String getRestr_time() {
        return restr_time;
    }

    public void setRestr_time(String restr_time) {
        this.restr_time = restr_time;
    }

    public float getRestr_star() {
        return restr_star;
    }

    public void setRestr_star(float restr_star) {
        this.restr_star = restr_star;
    }

    public String getRestr_foodType() {
        return restr_foodType;
    }

    public void setRestr_foodType(String restr_foodType) {
        this.restr_foodType = restr_foodType;
    }

    public String getRestr_cost() {
        return restr_cost;
    }

    public void setRestr_cost(String restr_cost) {
        this.restr_cost = restr_cost;
    }

    public String getRestr_parking() {
        return restr_parking;
    }

    public void setRestr_parking(String restr_parking) {
        this.restr_parking = restr_parking;
    }

    public String getRestr_tag() {
        return restr_tag;
    }

    public void setRestr_tag(String restr_tag) {
        this.restr_tag = restr_tag;
    }

    public String getRestr_menu() {
        return restr_menu;
    }

    public void setRestr_menu(String restr_menu) {
        this.restr_menu = restr_menu;
    }

    public String getRestr_desc() {
        return restr_desc;
    }

    public void setRestr_desc(String restr_desc) {
        this.restr_desc = restr_desc;
    }

    public String getRestr_picture() {
        return restr_picture;
    }

    public void setRestr_picture(String restr_picture) {
        this.restr_picture = restr_picture;
    }

    public String getRestr_category_loc() {
        return restr_category_loc;
    }

    public void setRestr_category_loc(String restr_category_loc) {
        this.restr_category_loc = restr_category_loc;
    }

    public String getBiz_reg_num() {
        return biz_reg_num;
    }

    public void setBiz_reg_num(String biz_reg_num) {
        this.biz_reg_num = biz_reg_num;
    }

    public String getRestr_viewCnt() {
        return restr_viewCnt;
    }

    public void setRestr_viewCnt(String restr_viewCnt) {
        this.restr_viewCnt = restr_viewCnt;
    }

    public String getRestr_reviewCnt() {
        return restr_reviewCnt;
    }

    public void setRestr_reviewCnt(String restr_reviewCnt) {
        this.restr_reviewCnt = restr_reviewCnt;
    }

    public String getRestr_likeCnt() {
        return restr_likeCnt;
    }

    public void setRestr_likeCnt(String restr_likeCnt) {
        this.restr_likeCnt = restr_likeCnt;
    }

    @Override
    public String toString() {
        return "RestrDto{" +
                "restr_NUM=" + restr_NUM +
                ", restr_name='" + restr_name + '\'' +
                ", restr_latitude=" + restr_latitude +
                ", restr_longitude=" + restr_longitude +
                ", restr_location='" + restr_location + '\'' +
                ", restr_location_tag='" + restr_location_tag + '\'' +
                ", restr_phone='" + restr_phone + '\'' +
                ", restr_time='" + restr_time + '\'' +
                ", restr_star=" + restr_star +
                ", restr_foodType='" + restr_foodType + '\'' +
                ", restr_cost='" + restr_cost + '\'' +
                ", restr_parking='" + restr_parking + '\'' +
                ", restr_tag='" + restr_tag + '\'' +
                ", restr_menu='" + restr_menu + '\'' +
                ", restr_desc='" + restr_desc + '\'' +
                ", restr_picture='" + restr_picture + '\'' +
                ", restr_category_loc='" + restr_category_loc + '\'' +
                ", biz_reg_num='" + biz_reg_num + '\'' +
                ", restr_viewCnt='" + restr_viewCnt + '\'' +
                ", restr_reviewCnt='" + restr_reviewCnt + '\'' +
                ", restr_likeCnt='" + restr_likeCnt + '\'' +
                '}';
    }
}