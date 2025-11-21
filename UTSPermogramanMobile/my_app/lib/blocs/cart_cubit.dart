import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartState {
  final List<Map<String, dynamic>> items;
  CartState(this.items);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addToCart(ProductModel product) {
    int index = state.items.indexWhere((e) => e['product'].id == product.id);

    if (index >= 0) {
      state.items[index]['qty']++;
    } else {
      state.items.add({'product': product, 'qty': 1});
    }

    emit(CartState(List.from(state.items)));
  }

  void removeFromCart(ProductModel product) {
    state.items.removeWhere((e) => e['product'].id == product.id);
    emit(CartState(List.from(state.items)));
  }

  void updateQuantity(ProductModel product, int qty) {
    int index = state.items.indexWhere((e) => e['product'].id == product.id);
    if (index < 0) return;

    if (qty <= 0) {
      removeFromCart(product);
    } else {
      state.items[index]['qty'] = qty;
      emit(CartState(List.from(state.items)));
    }
  }

  int get totalItems => state.items.fold<int>(
      0, (sum, e) => sum + (e['qty'] as int));

  int get totalPrice => state.items.fold<int>(
      0,
      (sum, e) =>
          sum + ((e['qty'] as int) * (e['product'] as ProductModel).price));

  void clearCart() {
    state.items.clear();
    emit(CartState([]));
  }
}
