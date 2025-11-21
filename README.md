
## 1. Perbedaan Cubit dan Bloc

Cubit dan Bloc sama-sama digunakan untuk **state management**, tetapi ada perbedaan mendasar:

- **Cubit** lebih sederhana. State diubah langsung melalui metode di Cubit.  
  Contoh: `cartCubit.addToCart(product)`.  

- **Bloc** bersifat **event-driven**. State hanya berubah setelah menerima **event**.  
  Contoh: `cartBloc.add(AddProductEvent(product))`.  

Cubit cocok untuk aplikasi kecil atau menengah dengan logika sederhana. Bloc lebih cocok untuk aplikasi kompleks dengan banyak alur state.  

Keduanya menjaga agar **UI tidak langsung mengubah data**, tapi selalu merespon perubahan state.

---

## 2. Pentingnya Memisahkan Model, Logika Bisnis, dan UI

Memisahkan ketiga komponen ini sangat penting karena:

- **Maintainability**: Mudah diperbaiki atau dikembangkan tanpa merusak bagian lain.  
- **Testability**: Logika bisnis dapat diuji secara unit test tanpa memerlukan UI.  
- **Reusability**: Model data dapat digunakan di banyak halaman, Cubit bisa digunakan di UI berbeda.  
- **Scalability**: Membantu pengembangan aplikasi besar dan kolaborasi tim lebih efisien.

Dengan pemisahan ini:
- **UI** hanya menampilkan state.  
- **Cubit/Bloc** mengatur state.  
- **Model** merepresentasikan data.

---

## 3. State yang Digunakan dalam CartCubit

Dalam `CartCubit`, beberapa state penting yang mungkin digunakan:

1. **CartInitial / Empty State**  
   - State awal ketika keranjang kosong atau aplikasi baru dibuka.  
   - UI menampilkan pesan “Keranjang kosong”.

2. **CartUpdated / Loaded State**  
   - State ketika ada perubahan pada keranjang, misalnya menambah, menghapus, atau mengubah jumlah item.  
   - UI otomatis diperbarui sesuai data terbaru.  
   - Dalam kode, ini diimplementasikan saat `emit(CartState(List.from(state.items)))`.

3. **CartError / Error State**  
   - State ketika terjadi kesalahan, misalnya gagal menambahkan item atau terjadi validasi.  
   - UI bisa menampilkan pesan error agar pengguna tahu ada masalah.

4. **CartLoading (opsional)**  
   - State sementara saat melakukan operasi yang memerlukan waktu, misalnya menyimpan data ke server.  
   - UI bisa menampilkan loading spinner sehingga pengguna tahu sistem sedang bekerja.

Dengan state ini, UI akan selalu **reaktif** dan menampilkan data terbaru dari `CartCubit`.

---

## 4. Implementasi Logika di Folder `blocs/cart_cubit.dart`

File `cart_cubit.dart` berisi logika bisnis:

- **Menambah item ke keranjang**: `addToCart(ProductModel product)`  
- **Menghapus item dari keranjang**: `removeFromCart(ProductModel product)`  
- **Update jumlah item**: `updateQuantity(ProductModel product, int qty)`  
- **Menghitung total item**: `totalItems`  
- **Menghitung total harga**: `totalPrice`  
- **Mengosongkan keranjang**: `clearCart()`  

Semua perubahan state memicu `emit` sehingga UI yang menggunakan `BlocBuilder` atau `BlocConsumer` akan otomatis diperbarui.

---

Dengan struktur ini, aplikasi mengikuti prinsip **Clean Architecture**:  
- **Model**: `ProductModel` (mewakili data produk)  
- **Cubit**: `CartCubit` (mengatur state dan logika keranjang)  
- **UI**: `pages/cart_home_page.dart`, `pages/cart_summary_page.dart`, dan `widgets/product_card.dart` (menampilkan state)
