class Product {
  int id;
  String name;
  String image;
  double price;

  Product(this.id, this.name, this.image, this.price);

  @override
  String toString() {
    return 'ID: $id | Name: $name | Image: $image | Price: $price';
  }
}