class OrdersModel{
  String? address;
  String? email;
  String? id;
  String? name;
  String? orderId;
  String? phone;
  String? profileImage;
  String? totalAmount;

  OrdersModel({
    this.address,
    this.email,
    this.id,
    this.name,
    this.orderId,
    this.phone,
    this.profileImage,
    this.totalAmount
  });

  factory OrdersModel.fromMap(map){
    return OrdersModel(
      address: map['address'],
      email: map['email'],
      id: map['id'],
      name: map['name'],
      orderId: map['orderId'],
      phone: map['phone'],
      profileImage: map['profileImage'],
      totalAmount: map['totalAmount'],
    );
  }
  Map<String,dynamic> toMap(){
    return{
      'address':address,
      'email':email,
      'id':id,
      'name':name,
      'orderId':orderId,
      'phone':phone,
      'profileImage':profileImage,
      'totalAmount':totalAmount,
    };
  }
}