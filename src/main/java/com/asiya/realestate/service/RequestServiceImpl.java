package com.asiya.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asiya.realestate.dao.RequestDao;
import com.asiya.realestate.entity.PropRequest;
import com.asiya.realestate.entity.Property;
import com.asiya.realestate.entity.Users;
import com.asiya.realestate.enums.Status;
@Service
public class RequestServiceImpl implements RequestService{

	@Autowired
	private RequestDao requestDao;
	@Override
	public void saveReq(PropRequest propRequest) {
		// TODO Auto-generated method stub
		requestDao.save(propRequest);
	}

	@Override
	public void deleteReq(PropRequest propRequest) {
		// TODO Auto-generated method stub
		requestDao.delete(propRequest);
	}

	@Override
	public List<PropRequest> getAllRequest() {
		// TODO Auto-generated method stub
		return requestDao.findAll();
	}

	@Override
	public PropRequest getById(int id) {
		// TODO Auto-generated method stub
		return requestDao.findById(id);
	}

//	@Override
//	public void updateStatus(int id, Status status) {
//		PropRequest request=requestDao.findById(id);
//		request.setStatus(status);
//		requestDao.save(request);
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public List<PropRequest> getAllPendingRequests() {
		// TODO Auto-generated method stub
		return requestDao.findByStatus(Status.PENDING);
	}

	@Override
	public PropRequest approveRequest(int id) {
		// TODO Auto-generated method stub
		PropRequest req=requestDao.findById(id);
		req.setStatus(Status.APPROVED);
		return requestDao.save(req);
	}

	@Override
	public PropRequest declineRequest(int id) {
		// TODO Auto-generated method stub
		PropRequest req =requestDao.findById(id);
		req.setStatus(Status.DECLINED);
		return requestDao.save(req);
	}

	@Override
	public List<PropRequest> getByUser(Users user) {
		// TODO Auto-generated method stub
		return requestDao.findByUser(user);
	}


	

}
