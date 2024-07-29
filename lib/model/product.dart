import 'package:get/get.dart';

class Product {
  int? id;
  String? brand;
  String? name;
  String? price;
  String? priceSign;
  String? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? category;
  String? productType;
  List<String>? tagList;
  String? createdAt;
  String? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<Map<String, dynamic>>? productColors;
  var isFavorite = false.obs;

  Product(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.priceSign,
      this.currency,
      this.imageLink,
      this.productLink,
      this.websiteLink,
      this.description,
      this.rating,
      this.category,
      this.productType,
      this.tagList,
      this.createdAt,
      this.updatedAt,
      this.productApiUrl,
      this.apiFeaturedImage,
      this.productColors});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    priceSign = json['price_sign'];
    currency = json['currency'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'] != null ? json['rating'].toDouble() : null;
    category = json['category'];
    productType = json['product_type'];
    tagList =
        json['tag_list'] != null ? List<String>.from(json['tag_list']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
    productColors = json['product_colors'] != null
        ? List<Map<String, dynamic>>.from(json['product_colors'])
        : null;
    isFavorite = false.obs;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['price'] = this.price;
    data['price_sign'] = this.priceSign;
    data['currency'] = this.currency;
    data['image_link'] = this.imageLink;
    data['product_link'] = this.productLink;
    data['website_link'] = this.websiteLink;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['category'] = this.category;
    data['product_type'] = this.productType;
    if (this.tagList != null) {
      data['tag_list'] = this.tagList;
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_api_url'] = this.productApiUrl;
    data['api_featured_image'] = this.apiFeaturedImage;
    if (this.productColors != null) {
      data['product_colors'] = this.productColors;
    }
    return data;
  }
}
