import 'dart:io';
import 'product.dart';

class ProductManager {
  static List<Product> products = [];

  // Thêm sản phẩm
  void addProduct() {
    print('\n=== THÊM SẢN PHẨM ===');

    stdout.write('Nhập ID: ');
    int id = int.parse(stdin.readLineSync()!);

    stdout.write('Nhập tên: ');
    String name = stdin.readLineSync()!;

    stdout.write('Nhập image: ');
    String image = stdin.readLineSync()!;

    stdout.write('Nhập giá: ');
    double price = double.parse(stdin.readLineSync()!);

    products.add(Product(id, name, image, price));

    print('Thêm thành công!');
  }

  // Hiển thị
  void displayProducts() {
    print('\n=== DANH SÁCH SẢN PHẨM ===');

    if (products.isEmpty) {
      print('Danh sách rỗng!');
      return;
    }

    for (var p in products) {
      print(p);
    }
  }

  // Tìm kiếm
  void searchProduct() {
    print('\n=== TÌM KIẾM ===');

    stdout.write('Nhập tên cần tìm: ');
    String keyword = stdin.readLineSync()!;

    var result = products.where((p) =>
        p.name.toLowerCase().contains(keyword.toLowerCase()));

    if (result.isEmpty) {
      print('Không tìm thấy!');
    } else {
      for (var p in result) {
        print(p);
      }
    }
  }

  // Xóa
  void deleteProduct() {
    print('\n=== XÓA SẢN PHẨM ===');

    stdout.write('Nhập ID cần xóa: ');
    int id = int.parse(stdin.readLineSync()!);

    products.removeWhere((p) => p.id == id);

    print('Xóa thành công!');
  }

  // Sửa
  void updateProduct() {
    print('\n=== SỬA SẢN PHẨM ===');

    stdout.write('Nhập ID cần sửa: ');
    int id = int.parse(stdin.readLineSync()!);

    for (var p in products) {
      if (p.id == id) {
        stdout.write('Tên mới: ');
        p.name = stdin.readLineSync()!;

        stdout.write('Image mới: ');
        p.image = stdin.readLineSync()!;

        stdout.write('Giá mới: ');
        p.price = double.parse(stdin.readLineSync()!);

        print('Cập nhật thành công!');
        return;
      }
    }

    print('Không tìm thấy sản phẩm!');
  }

  // Sắp xếp tăng dần
  void sortAscending() {
    products.sort((a, b) => a.price.compareTo(b.price));

    print('Đã sắp xếp tăng dần!');
  }

  // Sắp xếp giảm dần
  void sortDescending() {
    products.sort((a, b) => b.price.compareTo(a.price));

    print('Đã sắp xếp giảm dần!');
  }
}