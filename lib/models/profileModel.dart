class ProfileModel{
  String? profileId;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? role;
  String? password;
  String? profileImage;

  ProfileModel({
    this.profileId,
    this.name,
    this.phone,
    this.address,
    this.email,
    this.role,
    this.password,
    this.profileImage
  });

  factory ProfileModel.fromMap(map){
    return ProfileModel(
      profileId: map['id'],
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      email: map['email'],
      role: map['role'],
      password: map['password'],
      profileImage: map['profileImage'],
    );
  }

  set productImage(String productImage) {}
  Map<String,dynamic> toMap(){
    return{
      'id':profileId,
      'name':name,
      'phone':phone,
      'email':email,
      'address':address,
      'role':role,
      'password':password,
      'profileImage':profileImage,
    };
  }
}