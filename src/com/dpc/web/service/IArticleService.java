package com.dpc.web.service;

import java.util.List;

import com.dpc.utils.PageEntity;
import com.dpc.utils.PageResult;
import com.dpc.web.VO.DoctorVO;
import com.dpc.web.VO.Pager;
import com.dpc.web.mybatis3.domain.Article;
import com.dpc.web.mybatis3.domain.Doctor;
import com.dpc.web.mybatis3.domain.MedicalDynamic;

public interface IArticleService {

	void saveArticle(Article article);

	Pager<Article> findByPagination(Article article);

	void delArticle(int id);

	void update(Article article);

	Article getArticleById(int id);

	List<Article> getArticleByTypeAndCategory(int type, int category);

	
}
