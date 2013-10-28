package tushu.business.product.object;


import tushu.enums.IndexShowImageType;

public class Product {

	private Integer productId;
	
	private IndexShowType<Product> indexShowType;
	
	private String name;
	
	private Double sellPrice;
	
	private Double marketPrice;
	
	private Integer pages;
	
	private Double freight;
	
	private String productStandard;
	
	private String productMaterial;
	
	private String productProcess;

	private String productionCycle;
	
	private String content1;
	
	private String content2;
	
	private String content3;
	
	private String content4;
	
	private Images indexShowImage;
	
	private IndexShowImageType indexShowImageType;//首页显示产品图片的方式，横向 or 纵向
	
	private Integer viewCount;
	
	private Integer saledCount;
	
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	public IndexShowType<?> getIndexShowType() {
		return indexShowType;
	}

	public void setIndexShowType(IndexShowType<Product> indexShowType) {
		this.indexShowType = indexShowType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(Double sellPrice) {
		this.sellPrice = sellPrice;
	}

	public Double getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(Double marketPrice) {
		this.marketPrice = marketPrice;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public Double getFreight() {
		return freight;
	}

	public void setFreight(Double freight) {
		this.freight = freight;
	}

	public String getProductStandard() {
		return productStandard;
	}

	public void setProductStandard(String productStandard) {
		this.productStandard = productStandard;
	}

	public String getProductMaterial() {
		return productMaterial;
	}

	public void setProductMaterial(String productMaterial) {
		this.productMaterial = productMaterial;
	}

	public String getProductProcess() {
		return productProcess;
	}

	public void setProductProcess(String productProcess) {
		this.productProcess = productProcess;
	}

	public String getProductionCycle() {
		return productionCycle;
	}

	public void setProductionCycle(String productionCycle) {
		this.productionCycle = productionCycle;
	}

	public String getContent1() {
		return content1;
	}

	public void setContent1(String content1) {
		this.content1 = content1;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public String getContent3() {
		return content3;
	}

	public void setContent3(String content3) {
		this.content3 = content3;
	}

	public String getContent4() {
		return content4;
	}

	public void setContent4(String content4) {
		this.content4 = content4;
	}

	public Images getIndexShowImage() {
		return indexShowImage;
	}

	public void setIndexShowImage(Images indexShowImage) {
		this.indexShowImage = indexShowImage;
	}

	public IndexShowImageType getIndexShowImageType() {
		return indexShowImageType;
	}

	public void setIndexShowImageType(IndexShowImageType indexShowImageType) {
		this.indexShowImageType = indexShowImageType;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Integer getSaledCount() {
		return saledCount;
	}

	public void setSaledCount(Integer saledCount) {
		this.saledCount = saledCount;
	}
}
