package com.sosee.myapp.action;

import com.opensymphony.xwork2.Action;
import com.sosee.myapp.entity.Product;
import com.sosee.myapp.service.AddProductService;

public class AddProductAction implements Action{
    private Product product;
    private String result;
    private AddProductService aps=new AddProductService();
    
    public String addproduct(){
    	boolean flag=aps.addproduct(product);
    	if(flag){
    		result="success";
    	}else{
    		result="fail";
    	}
    	return "addproductSuccess";
    		
    	
    }
    public String productye(){
    	return "success";
    }
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String execute() throws Exception {
		boolean flag=aps.addproduct(product);
    	if(flag){
    		result="success";
    	}else{
    		result="fail";
    	}
    	return "addproductSuccess";
    		
	}
}
