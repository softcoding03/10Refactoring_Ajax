package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


//==> 상품관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct(@PathVariable int prodNo) throws Exception{
		System.out.println("prodNo 넘어온거는 ??? "+prodNo);
		System.out.println("/product/json/getProduct : GET");

		//Business Logic
		return productService.getProduct(prodNo);
	}

	@RequestMapping( value="json/addProduct", method=RequestMethod.POST )
	public void addProduct(@RequestBody Product product) throws Exception{
		System.out.println("product 넘어온거는 ??? "+product);
		System.out.println("/product/json/addProduct : POST");

		//Business Logic
		productService.addProduct(product);
		System.out.println("add 완료");
	}
	
	@RequestMapping( value="json/listProduct", method=RequestMethod.POST )
	public Map<String , Object> listProduct(@RequestBody Search search) throws Exception{
		
		System.out.println("Search 넘어온거는 ??? "+search);
		System.out.println("/product/json/listProduct : POST");

		//Business Logic
		int pageUnit = 3;
		int pageSize = 2;
		
		if(search.getCurrentPage()==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=productService.getProductList(search);
		map.put("message", "아주잘했어요");
		System.out.println("list 완료");
		
		return map;
	}
	
	@RequestMapping(value="json/updateProduct", method=RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception{
		
		System.out.println("product ??? -> "+ product);
		System.out.println("/product/updateProduct : POST");
		//Business Logic
		
		productService.updateProduct(product);
		
		Product product2 = productService.getProduct(product.getProdNo());
		
		//Map으로 Return 해줘야한다? 
		return product2;
	}
}