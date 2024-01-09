import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class ProductModel with ChangeNotifier {
  final String productId,
      productTitle,
      productCategory,
      productDescription,
      productImage;
  Timestamp? createdAt;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    this.createdAt,
  });

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data  = doc.data() as Map<String , dynamic>;
    // data.containsKey("key")
    return ProductModel(
        productId:  data["productId"],  //doc.get(field),
        productTitle: data["productTitle"],
        productCategory: data["productCategory"],
        productDescription: data["productDescription"],
        productImage: data["productImage"],
        createdAt: data["createdAt"],);
  }
}
