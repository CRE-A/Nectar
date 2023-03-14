package project.nectar.domain;

import java.util.Objects;

public class RestrMenuDto {
    private Integer restr_menu_NUM;
    private Integer restr_NUM;
    private String restr_menu_food;
    private Integer restr_menu_price;
    private String restr_menu_desc;
    private Integer restr_menu_hotdeal;   // 평상 시 : 0 , 핫딜 이벤트 진행 시 : 1

    public RestrMenuDto(){this(1,"파스타",5000,"스테디 셀러.  시그니쳐 메뉴");}
    public RestrMenuDto(Integer restr_NUM, String restr_menu_food, Integer restr_menu_price, String restr_menu_desc) {
        this.restr_NUM = restr_NUM;
        this.restr_menu_food = restr_menu_food;
        this.restr_menu_price = restr_menu_price;
        this.restr_menu_desc = restr_menu_desc;
    }

    public Integer getRestr_menu_NUM() {
        return restr_menu_NUM;
    }

    public void setRestr_menu_NUM(Integer restr_menu_NUM) {
        this.restr_menu_NUM = restr_menu_NUM;
    }

    public Integer getRestr_NUM() {
        return restr_NUM;
    }

    public void setRestr_NUM(Integer restr_NUM) {
        this.restr_NUM = restr_NUM;
    }

    public String getRestr_menu_food() {
        return restr_menu_food;
    }

    public void setRestr_menu_food(String restr_menu_food) {
        this.restr_menu_food = restr_menu_food;
    }

    public Integer getRestr_menu_price() {
        return restr_menu_price;
    }

    public void setRestr_menu_price(Integer restr_menu_price) {
        this.restr_menu_price = restr_menu_price;
    }

    public String getRestr_menu_desc() {
        return restr_menu_desc;
    }

    public void setRestr_menu_desc(String restr_menu_desc) {
        this.restr_menu_desc = restr_menu_desc;
    }

    public Integer getRestr_menu_hotdeal() {
        return restr_menu_hotdeal;
    }

    public void setRestr_menu_hotdeal(Integer restr_menu_hotdeal) {
        this.restr_menu_hotdeal = restr_menu_hotdeal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RestrMenuDto that = (RestrMenuDto) o;
        return Objects.equals(restr_menu_NUM, that.restr_menu_NUM) && Objects.equals(restr_NUM, that.restr_NUM);
    }

    @Override
    public int hashCode() {
        return Objects.hash(restr_menu_NUM, restr_NUM);
    }

    @Override
    public String toString() {
        return "RestrMenuDto{" +
                "restr_menu_NUM=" + restr_menu_NUM +
                ", restr_NUM=" + restr_NUM +
                ", restr_menu_food='" + restr_menu_food + '\'' +
                ", restr_menu_price=" + restr_menu_price +
                ", restr_menu_desc='" + restr_menu_desc + '\'' +
                ", restr_menu_hotdeal=" + restr_menu_hotdeal +
                '}';
    }
}
