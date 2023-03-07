package com.model2.mvc.service.product;


import java.util.HashMap;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;

//==> ��ǰ�������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service Interface Definition  
public interface ProductService {
	
	// ��ǰ���
	public void addProduct(Product product) throws Exception ;
	
	// ��ǰ����Ȯ��
	public Product getProduct(int productNo) throws Exception ;
	
	// ��ǰ��������Ʈ 
	public Map<String , Object> getProductList(Search search) throws Exception;
	
	// ��ǰ���� ����
	public void updateProduct(Product product) throws Exception ;
	

	
}
/*
public interface ProductService {
	
	
	public void addProduct(Product product) throws Exception;
	
	public Product getProduct(int productNo) throws Exception;
	
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	public void updateProduct(Product product) throws Exception;	

	
}
*/