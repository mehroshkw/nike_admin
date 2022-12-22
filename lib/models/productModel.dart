class ProductModel{
  String? productId;
  String? productName;
  String? productPrice;
  String? productDescription;
  String? productMaterial;
  String? productCategory;
  String? productImage;

  ProductModel({this.productId, this.productName, this.productPrice,
    this.productDescription, this.productMaterial, this.productCategory, this.productImage});

  factory ProductModel.fromMap(map){
    return ProductModel(
      productId: map['product_id'],
      productName: map['product_name'],
      productPrice: map['product_price'],
      productDescription: map['product_description'],
      productMaterial: map['product_material'],
      productCategory: map['product_category'],
      productImage: map['product_image'],
    );
  }
  Map<String,dynamic> toMap(){
    return{
      'product_id':productId,
      'product_name':productName,
      'product_price':productPrice,
      'product_description':productDescription,
      'product_material':productMaterial,
      'product_category':productCategory,
      'product_image':productImage,
    };
  }
}