package tushu.business.product.object;

import java.io.Serializable;
import java.util.LinkedList;

public class ProductType implements Serializable {

	private static final long serialVersionUID = -4363224711087280946L;

	private Integer id;

    private String name;

    private ProductType father;

    private LinkedList<ProductType> sons;
    
    private Product prodcut;
    
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ProductType getFather() {
		return father;
	}

	public void setFather(ProductType father) {
		this.father = father;
	}

	public LinkedList<ProductType> getSons() {
		return sons;
	}

	public void setSons(LinkedList<ProductType> sons) {
		this.sons = sons;
	}

	public Product getProdcut() {
		return prodcut;
	}

	public void setProdcut(Product prodcut) {
		this.prodcut = prodcut;
	}
}
