package com.dpc.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dpc.web.VO.PatientVO;
import com.dpc.web.VO.WishVO;
import com.dpc.web.mybatis3.domain.Discovery;
import com.dpc.web.mybatis3.domain.DiscoveryImage;
import com.dpc.web.mybatis3.domain.DiscoveryRemark;
import com.dpc.web.mybatis3.domain.Patient;
import com.dpc.web.mybatis3.domain.Wish;
import com.dpc.web.mybatis3.domain.WishRemark;
import com.dpc.web.mybatis3.mapper.DiscoveryMapper;
import com.dpc.web.mybatis3.mapper.PatientMapper;
import com.dpc.web.service.IPatientService;

@Service
@Transactional
public class PatientServiceImpl implements IPatientService {

	@Autowired
	private DiscoveryMapper discoveryMapper;
	@Autowired
	private PatientMapper patientMapper;
	
	@Override
	public void addDiscovery(Discovery discovery, List<String> imageUrls) {
		discoveryMapper.insertSelective(discovery);
		Integer discoveryId = discovery.getId();
		if(imageUrls!=null&&imageUrls.size()>0){
			for(String url : imageUrls){
				DiscoveryImage discoveryImage = new DiscoveryImage();
				discoveryImage.setDelFlag(0);
				discoveryImage.setDiscoveryId(discoveryId);
				discoveryImage.setImageUrl(url);
				discoveryMapper.addDiscoveryImage(discoveryImage);
			}
		}
	}

	@Override
	public void addDiscoveryRemark(DiscoveryRemark discoveryRemark) {
		discoveryMapper.addDiscoveryRemark(discoveryRemark);
		
	}

	@Override
	public List<Discovery> getDiscoveryList() {
		return discoveryMapper.getDiscoveryList();
	}

	@Override
	public List<DiscoveryImage> getDiscoveryImageListByDiscoveryId(Integer id) {
		return discoveryMapper.getDiscoveryImageListByDiscoveryId(id);
	}

	@Override
	public Discovery getDiscoveryDetail(int id) {
		return discoveryMapper.getDiscoveryDetail(id);
	}

	@Override
	public void addPatient(Patient patient) {
		patientMapper.insertSelective(patient);
	}

	@Override
	public PatientVO getProfile(int id) {
		return patientMapper.getProfile(id);
	}

	@Override
	public void addWish(Wish wish) {
		patientMapper.addWish(wish);
	}

	@Override
	public void addWishRemark(WishRemark wishRemark) {
		patientMapper.addWishRemark(wishRemark);
	}

	@Override
	public void updateWish(Wish wish) {
		patientMapper.updateWish(wish);
	}

	@Override
	public List<WishVO> getWishListByUserId(Integer id) {
		return patientMapper.getWishListByUserId(id);
	}
	
	
}