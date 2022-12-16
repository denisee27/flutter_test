import 'package:flutter/material.dart';

class Product {
  @required
  String judul;
  @required
  String imageURL;
  @required
  String deskripsi;

  Product(this.judul, this.imageURL, this.deskripsi);
}
