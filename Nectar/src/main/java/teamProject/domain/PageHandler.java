package teamProject.domain;

import java.util.Objects;

public class PageHandler {
    private Integer totalCnt;
    private Integer page;
    private Integer pageSize;
    private int NAV_SIZE=10;
    private int beginPage;
    private int endPage;
    private int lastPage;
    private boolean showPrev;
    private boolean showNext;



    public PageHandler(Integer page, Integer totalCnt) {
        this(page,10,totalCnt);
    }
    public PageHandler(Integer page, Integer pageSize, Integer totalCnt) {
        this.page=page;
        this.pageSize=pageSize;
        this.totalCnt=totalCnt;

        // tc 1~10 > 1      11~20 >2    21~30 > 3   31~40 > 4
        this.lastPage=(totalCnt-1)/pageSize+1;
        // page 1~10 --> 1  page 11~20 --> 11 page 21~30 --> 21
        this.beginPage=((page-1)/NAV_SIZE)*NAV_SIZE +1;
        this.endPage=Math.min(beginPage+NAV_SIZE-1, lastPage);
        this.showPrev = beginPage!=1;
        this.showNext = endPage!=lastPage;
    }


    public Integer getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(Integer totalCnt) {
        this.totalCnt = totalCnt;
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
        this.pageSize = pageSize;
    }

    public int getNAV_SIZE() {
        return NAV_SIZE;
    }

    public void setNAV_SIZE(int NAV_SIZE) {
        this.NAV_SIZE = NAV_SIZE;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PageHandler that = (PageHandler) o;
        return NAV_SIZE == that.NAV_SIZE && beginPage == that.beginPage && endPage == that.endPage && lastPage == that.lastPage && showPrev == that.showPrev && showNext == that.showNext && Objects.equals(totalCnt, that.totalCnt) && Objects.equals(page, that.page) && Objects.equals(pageSize, that.pageSize);
    }

    @Override
    public int hashCode() {
        return Objects.hash(totalCnt, page, pageSize, NAV_SIZE, beginPage, endPage, lastPage, showPrev, showNext);
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "totalCnt=" + totalCnt +
                ", page=" + page +
                ", pageSize=" + pageSize +
                ", NAV_SIZE=" + NAV_SIZE +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", lastPage=" + lastPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                '}';
    }
}
