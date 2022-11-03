package com.cafe24.kjh;

import java.util.List;

public interface User_Interface {
	
	public List<User_DTO> getsel(User_DTO dto);
	
	public void del(String id);
	
	public void registration(User_DTO dto);
	
}
