package model;

public class Products {
	private String id;
	private String name;
	private String price;
	private String stock;
	private String category;
	private String imagePath;
	public Products(String name, String price, String stock, String category, String imagePath) {
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.category = category;
		this.imagePath = imagePath;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
	
	
	
	
}
