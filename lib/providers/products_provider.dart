import 'package:flutter/material.dart';

import 'product.dart';
import '../data/product_list.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = ProductList.productList;

  List<Product> get items => [..._items];

  List<Product> get favouriteItems =>
      _items.where((productItem) => productItem.isFavorite).toList();

  void addProduct(Product product) {
    final newProduct = Product(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );

    _items.add(newProduct);
    notifyListeners();
  }

  Product findProductById(String id) =>
      _items.firstWhere((product) => product.id == id);

  void updateProduct(Product editedProduct) {
    final productIndex =
        _items.indexWhere((product) => product.id == editedProduct.id);
    if (productIndex > -1) {
      _items[productIndex] = editedProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
