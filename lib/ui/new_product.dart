import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nike_admin/models/categories.dart';
import 'package:nike_admin/models/productModel.dart';
import 'package:nike_admin/widegts/reusable_button.dart';
import 'package:uuid/uuid.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {

  final key = GlobalKey<FormState>();
  var categoryC = TextEditingController();
  var nameC = TextEditingController();
  var materialC = TextEditingController();
  var priceC = TextEditingController();
  var descipC = TextEditingController();
  var descountC = TextEditingController();
  var cat = 'Men';
  File _imageFile = File('');
  String _path = '';
  addproduct(){
   bool validate = key.currentState!.validate();
   if(validate){
     if (_path == ''){
       Fluttertoast.showToast(
           msg: "Please Select the image first",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 3,
           backgroundColor: Colors.black,
           textColor: Colors.white,
           fontSize: 16.0
       );
     // print('$nameC $categoryC $priceC, $materialC, $descipC, $descountC');
   }else{
       _uploadImage(_path, _imageFile);
       Fluttertoast.showToast(
           msg: "Adding Your Product Please Wait.....",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 3,
           backgroundColor: Colors.black,
           textColor: Colors.white,
           fontSize: 16.0
       );
     }

   }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    CatModel catModel;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 82,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: _path != ''?
                            FileImage(_imageFile):
                            const AssetImage('assets/images/logo.png') as ImageProvider,
                            radius: 80,
                          ),
                        ),
                        Positioned(
                            top: 110.0, left: 120,
                            child: InkWell(
                              onTap: () async{
                                Get.defaultDialog(
                                    title: 'Select Picture from:',
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            Get.back();
                                            // _selectImageFromCamera();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black,width: 1),
                                                borderRadius:const BorderRadius.all(Radius.circular(10))
                                            ),
                                            height:50,
                                            child:const Center(
                                              child: Text('Camera'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        InkWell(
                                          onTap:(){
                                            Get.back();
                                            selectImageFromGallery();

                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.green,width: 1),
                                                borderRadius:const BorderRadius.all(Radius.circular(10))
                                            ),
                                            height:50,
                                            child:const Center(
                                              child: Text('Gallery'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    radius: 10.0);

                              },
                              child: const CircleAvatar(
                                child: Icon(Icons.add,color: Colors.white,),
                              ),
                            )
                        )
                      ],
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(120),
                    //   child: Container(
                    //       width: double.infinity,
                    //       height: 200,
                    //       decoration: BoxDecoration(
                    //           color: Colors.black.withOpacity(0.9),
                    //           borderRadius: BorderRadius.circular(120)
                    //       ),
                    //       child: Container(
                    //         alignment: Alignment.center,
                    //         width: 50,
                    //         height: 70,
                    //         child: IconButton(
                    //           onPressed: (){},
                    //           icon: Icon(Icons.add_a_photo, color: Colors.white,),
                    //         ),
                    //       )
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  // NewTextField(labelText: "Product Name", controller: nameC, validator: (value) {if(value.isEmpty){
                  //   return "Must Not Be Empty";
                  // } return null;
                  //   },
                  // ),
                TextFormField(
                      controller: nameC,
                      validator: (v){
                        if (v!.isEmpty){
                          return "Field Must Not be Empty";
                        }
                        return null;
                      },
                          decoration: InputDecoration(
                          hintText: "Product Name",
                          border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                              SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField(
                    validator: (v){
                      if(v!.isEmpty){
                        return "Should Not be Empty";
                      }
                      return null;
                    },
                      hint: Text("Select Category"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                      value: catList.first.name,
                      items: catList.map((eg) => DropdownMenuItem(
                      value: eg.name,
                      child: Text(eg.name!))).toList(),

                      onChanged: (value){
                        setState(() {
                          cat = value!;
                        });
                      }
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: priceC,
                    validator: (v){
                      if (v!.isEmpty){
                        return "Field Must Not be Empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Price",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: materialC,
                    validator: (v){
                      if (v!.isEmpty){
                        return "Field Must Not be Empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Material",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: descipC,
                    validator: (v){
                      if (v!.isEmpty){
                        return "Field Must Not be Empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // TextFormField(
                  //   controller: descountC,
                  //   validator: (v){
                  //     if (v!.isEmpty){
                  //       return "Field Must Not be Empty";
                  //     }
                  //     return null;
                  //   },
                  //   decoration: InputDecoration(
                  //     hintText: "Discount",
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                  //       borderRadius: BorderRadius.circular(50.0),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                  //       borderRadius: BorderRadius.circular(50.0),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(width: 1, color: Colors.black), //<-- SEE HERE
                  //       borderRadius: BorderRadius.circular(50.0),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                 // NewTextField(labelText: "Price", controller: priceC),
                 //  SizedBox(
                 //    height: 5,
                 //  ),
                 //  NewTextField(labelText: "Material", controller: materialC),
                 //  SizedBox(
                 //    height: 5,
                 //  ),
                 //  NewTextField(labelText: "Description", controller: descipC),
                 //  SizedBox(
                 //    height: 5,
                 //  ),
                 //  NewTextField(labelText: "Discount", controller: descountC),
                 //  SizedBox(
                 //    height: 10,
                 //  ),

                  ReusablePrimaryButton(buttonText: "Add Product", onTap: (){
                    addproduct();
                  },)
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
  void selectImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      _path = pickedFile.path.split('/').last;
    }
    setState(() {});
  }
  selectImageFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      _path = pickedFile.path.split('/').last;
    }
  }
  void _uploadImage(String path, File imageFile) async{
    final ref = FirebaseStorage.instance.ref('productImage')
        .child(path);
    await ref.putFile(imageFile);
    final uri = await ref.getDownloadURL();
    postProductToFireStore(uri);
  }

  void postProductToFireStore(String uri)async {
    var uuid = const Uuid();
    String id = uuid.v4();
    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    ProductModel productModel = ProductModel();
    productModel.productId = id;
    productModel.productName = nameC.text;
    productModel.productCategory = cat.toString();
    productModel.productPrice = priceC.text;
    productModel.productMaterial = materialC.text;
    productModel.productDescription = descipC.text;
    productModel.productImage = uri;


    await firebaseFireStore
        .collection('products')
        .doc(id)
        .set(productModel.toMap()).catchError((onError){
          print(onError);
    });
  }
}
