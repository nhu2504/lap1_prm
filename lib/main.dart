import 'dart:io';
import 'product_manager.dart';

void main() {
  ProductManager manager = ProductManager();

  while (true) {
    print('''
========================
       MENU
========================
1. Thêm sản phẩm
2. Hiển thị sản phẩm
3. Tìm kiếm sản phẩm
4. Sửa sản phẩm
5. Xóa sản phẩm
6. Sắp xếp tăng dần
7. Sắp xếp giảm dần
0. Thoát
========================
''');

    stdout.write('Nhập lựa chọn: ');
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
        break;

      case 7:
        manager.sortDescending();
        break;

      case 0:
        print('Thoát chương trình!');
        return;

      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}