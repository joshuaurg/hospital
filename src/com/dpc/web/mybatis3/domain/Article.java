package com.dpc.web.mybatis3.domain;

import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class Article {
    private Integer id;

    private String title;

    private Integer category;

    private String resource;

    private Integer linkType;

    private String linkUrl;

    private String coverImageUrl;

    private String postTime;

    private Integer type;

    private Integer illType;

    private Integer delFlag;
    private Integer remarkCount;

    private String content;
    private String startDate;
    private String endDate;
    private Integer start;
    private Integer limit;
    
    private List<ArticleRemark> remarkList;
    
	public List<ArticleRemark> getRemarkList() {
		return remarkList;
	}
	public void setRemarkList(List<ArticleRemark> remarkList) {
		this.remarkList = remarkList;
	}
	public Integer getRemarkCount() {
		return remarkCount;
	}
	public void setRemarkCount(Integer remarkCount) {
		this.remarkCount = remarkCount;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getCategory() {
		return category;
	}
	public void setCategory(Integer category) {
		this.category = category;
	}
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	public Integer getLinkType() {
		return linkType;
	}
	public void setLinkType(Integer linkType) {
		this.linkType = linkType;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public String getCoverImageUrl() {
		return coverImageUrl;
	}
	public void setCoverImageUrl(String coverImageUrl) {
		this.coverImageUrl = coverImageUrl;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getIllType() {
		return illType;
	}
	public void setIllType(Integer illType) {
		this.illType = illType;
	}
	public Integer getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}

    
    

}