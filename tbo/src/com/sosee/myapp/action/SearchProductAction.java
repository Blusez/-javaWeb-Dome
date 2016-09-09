package com.sosee.myapp.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.sosee.myapp.entity.Product;
import com.sosee.myapp.service.SearchProductService;

public class SearchProductAction implements Action{
	private List<Product> products;
	private String productName;
	private SearchProductService sps = new SearchProductService();

	public String findproduct(){
	   products=sps.searchproduct();
	   
	   return "findSuccess";
	   
   }
	
	public String findByName(){
		products=sps.findproductByname(productName);
		return "findbynameSuccess";
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String execute() throws Exception {
		products=sps.searchproduct();
		   
		   return "findSuccess";
	}
	

}
