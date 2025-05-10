package com.asiya.realestate.service;

import java.util.List;

import com.asiya.realestate.entity.PropRequest;
import com.asiya.realestate.entity.Users;
import com.asiya.realestate.enums.Status;

public interface RequestService {
	
	public void saveReq(PropRequest propRequest);
	public void deleteReq(PropRequest propRequest);
	public List<PropRequest> getAllRequest();
	public PropRequest getById(int id);
//	public void updateStatus(int id,Status status);
    public List<PropRequest> getAllPendingRequests();
    public PropRequest approveRequest(int id);
    public PropRequest declineRequest(int id);
    public List<PropRequest> getByUser(Users user);
    

	


}
