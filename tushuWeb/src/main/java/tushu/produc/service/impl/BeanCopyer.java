package tushu.produc.service.impl;


import tushu.business.product.object.AddressMessage;
import tushu.business.product.object.ExpressMessage;
import tushu.business.product.object.Images;
import tushu.business.product.object.IndexShowType;
import tushu.business.product.object.OrderForm;
import tushu.business.product.object.Product;
import tushu.business.product.object.ProductType;
import tushu.enums.IndexShowImageType;
import tushu.enums.OrderType;
import tushu.enums.Types;
import tushu.model.AddressMessageDO;
import tushu.model.ExpressMessageDO;
import tushu.model.ImagesDO;
import tushu.model.IndexShowTypeDO;
import tushu.model.OrderFormDO;
import tushu.model.ProductDO;
import tushu.model.ProductTypeDO;


public class BeanCopyer {

	public static ProductTypeDO toProductTypeDO(ProductType productType){
		ProductTypeDO productTypeDO = new ProductTypeDO();
		productTypeDO.setFatherId(productType.getFather() != null ? productType.getFather().getId() : null);
		productTypeDO.setId(productType.getId());
		productTypeDO.setName(productType.getName());
		productTypeDO.setProductId(productType.getProdcut() != null ? productType.getProdcut().getProductId() : null);
		return productTypeDO;
	}
	
	public static ProductType toProductType(ProductTypeDO productTypeDO){
		ProductType productType = new ProductType();
		productType.setId(productTypeDO.getId());
		productType.setName(productTypeDO.getName());
		return productType;
	}
	
	public static <E> IndexShowType<E> toIndexShowType(IndexShowTypeDO indexShowTypeDO){
		IndexShowType<E> indexShowType = new IndexShowType<E>();
		indexShowType.setDescribe(indexShowTypeDO.getDescribe());
		indexShowType.setId(indexShowTypeDO.getId());
		indexShowType.setName(indexShowTypeDO.getName());
		indexShowType.setType(Types.valueOf(indexShowTypeDO.getType()));
		indexShowType.setIndex(indexShowTypeDO.getIndex());
		return indexShowType;
	}
	
	public static <E> IndexShowTypeDO toIndexShowTypeDO(IndexShowType<E> indexShowType){
		IndexShowTypeDO indexShowTypeDO = new IndexShowTypeDO();
		indexShowTypeDO.setDescribe(indexShowType.getDescribe());
		indexShowTypeDO.setId(indexShowType.getId());
		indexShowTypeDO.setName(indexShowType.getName());
		indexShowTypeDO.setType(indexShowType.getType() != null ? indexShowType.getType().toString() : null);
		indexShowTypeDO.setIndex(indexShowType.getIndex());
		return indexShowTypeDO;
	}
	
	public static Product toProduct(ProductDO productDO){
		Product product = new Product();
		
		product.setContent1(productDO.getContent1());
		product.setContent2(productDO.getContent2());
		product.setContent3(productDO.getContent3());
		product.setContent4(productDO.getContent4());
		product.setFreight(productDO.getFreight());
		product.setMarketPrice(productDO.getMarketPrice());
		product.setName(productDO.getName());
		product.setPages(productDO.getPages());
		product.setProductId(productDO.getProductId());
		product.setProductMaterial(productDO.getProductMaterial());
		product.setProductProcess(productDO.getProductProcess());
		product.setProductStandard(productDO.getProductStandard());
		product.setProductionCycle(productDO.getProductionCycle());
		product.setSellPrice(productDO.getSellPrice());
		product.setIndexShowImageType(productDO.getIndexShowImageType() != null ? IndexShowImageType.valueOf(productDO.getIndexShowImageType()) : null);
		product.setViewCount(productDO.getViewCount());
		product.setSaledCount(productDO.getSaledCount());
		
		return product;
	}
	
	public static ProductDO toProductDO(Product product){
		ProductDO productDO = new ProductDO();
		productDO.setContent1(product.getContent1());
		productDO.setContent2(product.getContent2());
		productDO.setContent3(product.getContent3());
		productDO.setContent4(product.getContent4());
		productDO.setFreight(product.getFreight());
		productDO.setIndexShowTypeId(product.getIndexShowType() != null ? product.getIndexShowType().getId() : null);
		productDO.setMarketPrice(product.getMarketPrice());
		productDO.setName(product.getName());
		productDO.setPages(product.getPages());
		productDO.setProductId(product.getProductId());
		productDO.setProductMaterial(product.getProductMaterial());
		productDO.setProductProcess(product.getProductProcess());
		productDO.setProductStandard(product.getProductStandard());
		productDO.setProductionCycle(product.getProductionCycle());
		productDO.setSellPrice(product.getSellPrice());
		productDO.setIndexShowImage(product.getIndexShowImage() != null ? product.getIndexShowImage().getId() : null);
		productDO.setIndexShowImageType(product.getIndexShowImageType() != null ? product.getIndexShowImageType().toString() : null);
		productDO.setViewCount(product.getViewCount());
		productDO.setSaledCount(product.getSaledCount());
		return productDO;
	}
	
	public static Images toImage(ImagesDO imagesDO){
		Images images = new Images();
		images.setId(imagesDO.getId());
		images.setIndex(imagesDO.getIndex());
		images.setName(imagesDO.getName());
		images.setUrl(imagesDO.getUrl());
		return images;
	}
	
	public static ImagesDO toImagesDO(Images images){
		ImagesDO imagesDO = new ImagesDO();
		imagesDO.setId(images.getId());
		imagesDO.setIndex(images.getIndex());
		imagesDO.setName(images.getName());
		imagesDO.setUrl(images.getUrl());
		return imagesDO;
	}
	
	public static OrderFormDO toOrderFormDO(OrderForm orderForm){
		OrderFormDO orderFormDO = new OrderFormDO();
		orderFormDO.setCreateTime(orderForm.getCreateTime());
		orderFormDO.setId(orderForm.getId());
		orderFormDO.setOrderNumber(orderForm.getOrderNumber());
		orderFormDO.setOrderType(orderForm.getOrderType() != null ? orderForm.getOrderType().toString() : null);
		orderFormDO.setPaymentTime(orderForm.getPaymentTime());
		orderFormDO.setProductId(orderForm.getProduct() != null ? orderForm.getProduct().getProductId() : null);
		orderFormDO.setUserId(orderForm.getUser() != null ? Integer.parseInt(orderForm.getUser().getId().toString()) : null);
		orderFormDO.setProductNumber(orderForm.getProductNumber());
		orderFormDO.setAmountPayable(orderForm.getAmountPayable());
		orderFormDO.setExpressMessage(orderForm.getExpressMessage() != null ? orderForm.getExpressMessage().getId() : null);
		return orderFormDO;
	}
	
	public static OrderForm toOrderForm(OrderFormDO orderFormDO){
		OrderForm orderForm = new OrderForm();
		orderForm.setCreateTime(orderFormDO.getCreateTime());
		orderForm.setId(orderFormDO.getId());
		orderForm.setOrderNumber(orderFormDO.getOrderNumber());
		orderForm.setOrderType(orderFormDO.getOrderType() != null ? OrderType.valueOf(orderFormDO.getOrderType()) : null);
		orderForm.setPaymentTime(orderFormDO.getPaymentTime());
		orderForm.setProductNumber(orderFormDO.getProductNumber());
		orderForm.setAmountPayable(orderFormDO.getAmountPayable());
		return orderForm;
	}
	
	public static AddressMessage toAddressMessage(AddressMessageDO addressMessageDO){
		AddressMessage addressMessage = new AddressMessage();
		addressMessage.setCity(addressMessageDO.getCity());
		addressMessage.setCounty(addressMessageDO.getCounty());
		addressMessage.setEmail(addressMessageDO.getEmail());
		addressMessage.setId(addressMessageDO.getId());
		addressMessage.setOrderFormId(addressMessageDO.getOrderFormId());
		addressMessage.setPhone(addressMessageDO.getPhone());
		addressMessage.setPostCode(addressMessageDO.getPostCode());
		addressMessage.setProvince(addressMessageDO.getProvince());
		addressMessage.setRecipientsName(addressMessageDO.getRecipientsName());
		addressMessage.setStreet(addressMessageDO.getStreet());
		addressMessage.setTel(addressMessageDO.getTel());
		addressMessage.setUserId(addressMessageDO.getUserId());
		return addressMessage;
	}
	
	public static AddressMessageDO toAddressMessageDO(AddressMessage addressMessage){
		AddressMessageDO addressMessageDO = new AddressMessageDO();
		addressMessageDO.setCity(addressMessage.getCity());
		addressMessageDO.setCounty(addressMessage.getCounty());
		addressMessageDO.setEmail(addressMessage.getEmail());
		addressMessageDO.setId(addressMessage.getId());
		addressMessageDO.setOrderFormId(addressMessage.getOrderFormId());
		addressMessageDO.setPhone(addressMessage.getPhone());
		addressMessageDO.setPostCode(addressMessage.getPostCode());
		addressMessageDO.setProvince(addressMessage.getProvince());
		addressMessageDO.setRecipientsName(addressMessage.getRecipientsName());
		addressMessageDO.setStreet(addressMessage.getStreet());
		addressMessageDO.setTel(addressMessage.getTel());
		addressMessageDO.setUserId(addressMessage.getUserId());
		return addressMessageDO;
	}
	
	public static ExpressMessage toExpressMessage(ExpressMessageDO expressMessageDO){
		ExpressMessage expressMessage = new ExpressMessage();
		expressMessage.setExpressName(expressMessageDO.getExpressName());
		expressMessage.setExpressPrice(expressMessageDO.getExpressPrice());
		expressMessage.setId(expressMessageDO.getId());
		return expressMessage;
	}
	
	public static ExpressMessageDO toExpressMessageDO(ExpressMessage expressMessage){
		ExpressMessageDO expressMessageDO = new ExpressMessageDO();
		expressMessageDO.setExpressName(expressMessage.getExpressName());
		expressMessageDO.setExpressPrice(expressMessage.getExpressPrice());
		expressMessageDO.setId(expressMessage.getId());
		return expressMessageDO;
	}
}
