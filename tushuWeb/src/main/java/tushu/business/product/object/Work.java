package tushu.business.product.object;

import java.util.List;

import tushu.business.user.object.User;

public class Work {

	private Integer id;
	
	private Product product;
	
	private User user;
	
	private List<Images> images;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Images> getImages() {
		return images;
	}

	public void setImages(List<Images> images) {
		this.images = images;
	}
}
