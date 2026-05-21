class Product {

  final int id;

  String name;
  String image;
  double price;

  // Constructor
  Product(
      this.id,
      this.name,
      this.image,
      this.price
      );

  // Factory constructor
  factory Product.fromJson(
      Map<String, dynamic> json
      ) {

    return Product(
      json['id'],
      json['name'],
      json['image'],
      json['price'].toDouble(),
    );
  }

  // Product -> Json
  Map<String, dynamic> toJson() {

    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
    };
  }

  @override
  String toString() {

    return
      'ID: $id | '
          'Name: $name | '
          'Image: $image | '
          'Price: $price';
  }
}