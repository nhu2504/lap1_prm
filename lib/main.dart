import 'dart:io';
import 'product.dart';
import 'product_dao.dart';

void main() {

  ProductDAO manager = ProductDAO();

  while (true) {

    print('''
========================
         MENU
========================
1. Add Product
2. Display Products
3. Search Product By Name
4. Update Product
5. Delete Product
6. Sort Ascending
7. Sort Descending
8. Find Product By ID
9. Search Product By Price
10. Increase Price 10%
11. Json Demo
0. Exit
========================
''');

    stdout.write('Choose: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {

      case 1:

        manager.addProduct();
        break;

      case 2:

        manager.displayProducts();
        break;

      case 3:

        manager.searchProduct();
        break;

      case 4:

        manager.updateProduct();
        break;

      case 5:

        manager.deleteProduct();
        break;

      case 6:

        manager.sortAscending();

        manager.displayProducts();

        break;

      case 7:

        manager.sortDescending();

        manager.displayProducts();

        break;

      case 8:

        stdout.write('Input ID: ');
        int id = int.parse(stdin.readLineSync()!);

        Product? p = manager.find(id);

        if (p != null) {
          print(p);
        } else {
          print('Product not found!');
        }

        break;

      case 9:

        stdout.write('Input minimum price: ');

        double minPrice =
        double.parse(stdin.readLineSync()!);

        List<Product> result =
        manager.searchByPrice(minPrice);

        if (result.isEmpty) {

          print('Product not found!');

        } else {

          for (var p in result) {
            print(p);
          }
        }

        break;

      case 10:

        manager.increasePrice();

        manager.displayProducts();

        break;

      case 11:

        Map<String, dynamic> json = {
          'id': 100,
          'name': 'Camera',
          'image': 'camera.png',
          'price': 500
        };

        Product p = Product.fromJson(json);

        print(p);

        print(p.toJson());

        break;

      case 0:

        print('Exit program!');
        return;

      default:

        print('Invalid choice!');
    }
  }
}