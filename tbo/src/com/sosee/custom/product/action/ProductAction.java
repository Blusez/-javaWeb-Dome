package com.sosee.custom.product.action;

import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.custom.product.pojo.Product;
import com.sosee.custom.product.service.ProductService;
import com.sosee.util.StringUtils;

public class ProductAction extends AbstractAction {
private ProductService productService;
	
	private List<Product> productList;
	private boolean editable=false;
	private Product product;
	
	
	public String transferToProductList(){
		productList = productService.getProductList();
		return "list";
	}
	/**
	 * 
	 */
	public String save(){
		if (StringUtils.isNullString(product.getId())) {
			productService.add(product);
		} else {
			productService.update(product);
		}
		errorMessage = "保存成功！";
		product = null;
		return transferToProductList();
	}
	/**
	 * 
	 */
	public String editProduct(){
		editable=true;
		product = productService.getProduct(id);
		return transferToProductList();
	}
	/**
	 * 
	 */
	public String deleteProduct(){
		productService.delete(id);
		return transferToProductList();
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
