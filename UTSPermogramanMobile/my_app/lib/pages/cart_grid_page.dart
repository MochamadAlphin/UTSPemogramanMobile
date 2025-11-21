import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class CartGridPage extends StatelessWidget {
  CartGridPage({super.key});

final List<ProductModel> dummyProducts = [
  ProductModel(id: '1', name: 'Makanan Kucing', price: 20000, image: 'assets/images/gambar1.png'),
  ProductModel(id: '2', name: 'Shampo Kucing', price: 15000, image: 'assets/images/gambar2.png'),
  ProductModel(id: '3', name: 'Litter Box', price: 25000, image: 'assets/images/gambar3.png'),
  ProductModel(id: '4', name: 'Sisir Kucing', price: 15000, image: 'assets/images/gambar4.png'),
];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: dummyProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: dummyProducts[index]);
        },
      ),
    );
  }
}
