import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      shadowColor: Colors.grey.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: product.image.isEmpty
                  ? Container(
                      color: Colors.grey[200],
                      child: Center(
                          child: Text(
                        "Gambar",
                        style: TextStyle(color: Colors.grey),
                      )),
                    )
                  : Image.asset(product.image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text("Rp ${product.price}",
                    style: TextStyle(color: Colors.green[700])),
                SizedBox(height: 6),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 36),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    context.read<CartCubit>().addToCart(product);
                  },
                  child: Text("Tambah ke Keranjang"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
