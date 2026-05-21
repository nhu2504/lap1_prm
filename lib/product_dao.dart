import 'dart:io';
import 'product.dart';

class ProductDAO {

  // Static List
  static List<Product> products = [

    Product(1, "Laptop", "laptop.png", 1500),

    Product(2, "IPhone", "iphone.png", 1200),

    Product(3, "Tablet", "tablet.png", 800),

    Product(4, "Mouse", "mouse.png", 50),

    Product(5, "Keyboard", "keyboard.png", 100),
  ];

  // Add Product
  void addProduct() {

    print('\n=== ADD PRODUCT ===');

    stdout.write('Input ID: ');
    int id = int.parse(stdin.readLineSync()!);

    // Check duplicate id
    bool exists = products.any((p) => p.id == id);

    if (exists) {

      print('ID already exists!');
      return;
    }

    stdout.write('Input Name: ');
    String name = stdin.readLineSync()!;

    stdout.write('Input Image: ');
    String image = stdin.readLineSync()!;

    stdout.write('Input Price: ');
    double price =
    double.parse(stdin.readLineSync()!);

    products.add(
      Product(id, name, image, price),
    );

    print('Add success!');
  }

  // Display Products
  void displayProducts() {

    print('\n=== PRODUCT LIST ===');

    if (products.isEmpty) {

      print('List is empty!');
      return;
    }

    for (var p in products) {
      print(p);
    }
  }

  // Search By Name
  void searchProduct() {

    print('\n=== SEARCH PRODUCT ===');

    stdout.write('Input keyword: ');
    String keyword =
    stdin.readLineSync()!;

    var result = products.where((p) {

      return p.name
          .toLowerCase()
          .contains(
          keyword.toLowerCase());

    });

    if (result.isEmpty) {

      print('Product not found!');

    } else {

      for (var p in result) {
        print(p);
      }
    }
  }

  // Search By Price
  List<Product> searchByPrice(
      double minPrice
      ) {

    return products.where((p) {

      return p.price >= minPrice;

    }).toList();
  }

  // Delete Product
  void deleteProduct() {

    print('\n=== DELETE PRODUCT ===');

    stdout.write('Input ID: ');

    int? id =
    int.tryParse(stdin.readLineSync()!);

    if (id == null) {

      print('Invalid ID!');
      return;
    }

    // Check product exists
    bool exists =
    products.any((p) => p.id == id);

    if (!exists) {

      print('Product not found!');
      return;
    }

    products.removeWhere(
            (p) => p.id == id
    );

    print('Delete success!');
  }

  // Update Product
  void updateProduct() {

    print('\n=== UPDATE PRODUCT ===');

    stdout.write('Input ID: ');
    int id =
    int.parse(stdin.readLineSync()!);

    for (var p in products) {

      if (p.id == id) {

        stdout.write('New Name: ');
        p.name =
        stdin.readLineSync()!;

        stdout.write('New Image: ');
        p.image =
        stdin.readLineSync()!;

        stdout.write('New Price: ');

        double? newPrice =
        double.tryParse(
            stdin.readLineSync()!
        );

        if (newPrice == null) {

          print('Invalid price!');
          return;
        }

        p.price = newPrice;

        print('Update success!');
        return;
      }
    }

    print('Product not found!');
  }

  // Find Product
  Product? find(int id) {

    for (var p in products) {

      if (p.id == id) {
        return p;
      }
    }

    return null;
  }

  // Sort Ascending
  void sortAscending() {

    products.sort((a, b) {

      return a.price
          .compareTo(b.price);

    });

    print('Sort ascending success!');
  }

  // Sort Descending
  void sortDescending() {

    products.sort((a, b) {

      return b.price
          .compareTo(a.price);

    });

    print('Sort descending success!');
  }

  // Increase Price 10%
  void increasePrice() {

    products = products.map((p) {

      return Product(
        p.id,
        p.name,
        p.image,
        p.price * 1.1,
      );

    }).toList();

    print(
        'Increase price 10% success!'
    );
  }
}