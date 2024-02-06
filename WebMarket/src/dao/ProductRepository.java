package dao;

import java.util.ArrayList;

import vo.Product;

public class ProductRepository {
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel"
				+ "iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation"
				+ "Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super Amored display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	//상품 전체 가져오기
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	
	//상품 ID에 해당하는 상품 가져오기
	public Product getProductById(String productId) {
		Product product = null; //리턴할 상품
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product prod = listOfProducts.get(i);
			if(prod != null && prod.getProductId() != null && prod.getProductId().equals(productId)) {
				product = prod;
				break;
			}
		}
		return product;
	}
	
	//상품 추가하기
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
	
}
