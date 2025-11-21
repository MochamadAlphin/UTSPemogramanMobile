import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';
import '../models/product_model.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Keranjang")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(child: Text("Keranjang kosong"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: state.items.length,
                  separatorBuilder: (_, __) => Divider(),
                  itemBuilder: (context, i) {
                    final item = state.items[i];
                    final ProductModel p = item['product'];
                    final qty = item['qty'];

                    return ListTile(
                      leading: p.image.isEmpty
                          ? Container(
                              width: 50,
                              height: 50,
                              color: Colors.grey[200],
                              child: Center(child: Text("Gambar")),
                            )
                          : Image.asset(p.image, width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(p.name),
                      subtitle: Text("Rp ${p.price} x $qty"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<CartCubit>().updateQuantity(p, qty - 1);
                              },
                              icon: Icon(Icons.remove)),
                          Text("$qty"),
                          IconButton(
                              onPressed: () {
                                context.read<CartCubit>().updateQuantity(p, qty + 1);
                              },
                              icon: Icon(Icons.add)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Item: ${context.read<CartCubit>().totalItems}"),
                    Text("Total Harga: Rp ${context.read<CartCubit>().totalPrice}"),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
                      onPressed: () {
                        context.read<CartCubit>().clearCart();
                      },
                      child: Text("Checkout"),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
