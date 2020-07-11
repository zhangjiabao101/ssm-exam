package com.aaa.util;

/**
 * 适用于layui中的分页插件
 * @author 淮南King
 * @date 2020-07-04
 */
public class LayuiPageHelper {
    private int begin = 0;
    private int pageSize = 10;
    private int count = 0;
    private int pageNow = 1;
    private int pageTotal = 0;
    /** 用于接受layui发送的当前页 */
    private int page = 1;
    /** 用于接受layui发送的页大小 */
    private int limit = 5;

    public LayuiPageHelper() {
    }

    public LayuiPageHelper(int page, int limit) {
        this.page = page;
        this.limit = limit;
    }

    public int getPage() {
        return pageNow;
    }

    public void setPage(int page) {
        this.page = page;
        this.pageNow = page;
    }

    public int getLimit() {
        return pageSize;
    }

    public void setLimit(int limit) {
        this.pageSize = limit;
        this.limit = limit;
    }

    public int getBegin() {
        this.begin = (this.pageNow - 1) * this.pageSize;
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageTotal() {
        this.pageTotal = this.count % this.pageSize == 0 ? this.count / this.pageSize : this.count / this.pageSize + 1;
        return pageTotal;
    }

    public void setPageTotal(int pageTotal) {
        this.pageTotal = pageTotal;
    }
}
