package com.dpc.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dpc.utils.ConstantUtil;
import com.dpc.utils.PageContext;
import com.dpc.utils.PageEntity;
import com.dpc.utils.PageResult;
import com.dpc.web.VO.DoctorVO;
import com.dpc.web.VO.Pager;
import com.dpc.web.mybatis3.domain.Article;
import com.dpc.web.mybatis3.domain.Doctor;
import com.dpc.web.mybatis3.mapper.DoctorMapper;
import com.dpc.web.service.IBackDoctorService;

@Service
@Transactional
public class BackDoctorServiceImpl implements IBackDoctorService {

	@Autowired
	private DoctorMapper doctorMapper ;

	@Override
	public Pager<DoctorVO> findByPaginaton(DoctorVO doctor) {
		Integer start = PageContext.getStart();
		Integer limit = PageContext.getLimit();
		doctor.setStart(start);
		doctor.setLimit(limit);
		List<DoctorVO> datas = doctorMapper.getDoctorListWithPager(doctor,start,limit);
		if(datas!=null&&datas.size()>0){
			for(DoctorVO d : datas){
				
			}
		}
		Integer totalCount = doctorMapper.getAllDoctorCount(doctor);
		Pager<DoctorVO> pager = new Pager<DoctorVO>();
		pager.setPageOffset(start);
		pager.setPageSize(limit);
		pager.setTotal(totalCount);
		pager.setDatas(datas);
		
		return pager;
	}
	
	
	
}
