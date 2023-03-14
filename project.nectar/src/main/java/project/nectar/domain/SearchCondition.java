package project.nectar.domain;

import org.springframework.web.util.UriComponentsBuilder;

import static java.lang.Math.max;
import static java.lang.Math.min;
import static java.util.Objects.requireNonNullElse;

public class SearchCondition {
    private Integer page = 1;
    private Integer pageSize = DEFAULT_PAGE_SIZE;
    private String option = "";
    private String  keyword = "";
    private String  foodType = "";
    private String  cost = "";
    private String  location = "";
    private String  parking = "";
    private String  tag = "";
    private Integer offset;

    public static final int MIN_PAGE_SIZE = 5;
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int MAX_PAGE_SIZE = 50;

    public SearchCondition() {}
    public SearchCondition(Integer page, Integer pageSize) {
        this(page,pageSize,"","","","","","","");
    }
    public SearchCondition(Integer page, Integer pageSize, String option, String keyword, String foodType, String cost, String location, String parking, String tag) {
        this.page = page;
        this.pageSize = pageSize;
        this.option = option;
        this.keyword = keyword;
        this.foodType = foodType;
        this.cost = cost;
        this.location = location;
        this.parking = parking;
        this.tag = tag;
    }
    public String getQueryString() {
        return getQueryString(page);
    }

    public String getQueryString(Integer page) {
        // ?page=10&pageSize=10&option=A&keyword=title
        return UriComponentsBuilder.newInstance()
                .queryParam("page",     page)
                .queryParam("pageSize", pageSize)
//                .queryParam("option",   option)
//                .queryParam("keyword",  keyword)
                .build().toString();
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
//        this.pageSize = pageSize;
        this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
        this.pageSize = max(MIN_PAGE_SIZE, min(this.pageSize, MAX_PAGE_SIZE));

    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }
    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getFoodType() {
        return foodType;
    }

    public void setFoodType(String foodType) {
        this.foodType = foodType;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getParking() {
        return parking;
    }

    public void setParking(String parking) {
        this.parking = parking;
    }

    public String gettag() {
        return tag;
    }

    public void settag(String tag) {
        this.tag = tag;
    }

    public Integer getOffset() {
        return (page-1)*pageSize;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", keyword='" + keyword + '\'' +
                ", foodType='" + foodType + '\'' +
                ", cost='" + cost + '\'' +
                ", location='" + location + '\'' +
                ", parking='" + parking + '\'' +
                ", tag='" + tag + '\'' +
                '}';
    }
}
