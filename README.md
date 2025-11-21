1. Perbedaan Cubit dan Bloc

Cubit dan Bloc keduanya digunakan untuk state management, tetapi berbeda cara kerjanya:

Cubit lebih sederhana, langsung memiliki state dan metode untuk mengubah state. Contoh: cartCubit.addToCart(product).

Bloc bersifat event-driven, artinya state hanya berubah setelah menerima event. Contoh: cartBloc.add(AddProductEvent(product)).

Cubit cocok untuk aplikasi kecil hingga menengah dengan logika sederhana, sedangkan Bloc lebih cocok untuk aplikasi kompleks dengan banyak alur state.

Intinya, Cubit adalah versi ringan dari Bloc. Kedua pendekatan menjaga UI tidak langsung mengubah data, tapi merespons perubahan state.

2. Pentingnya Memisahkan Model, Logika Bisnis, dan UI

Memisahkan tiga komponen ini sangat penting untuk:

Maintainability: Memudahkan perawatan dan pengembangan karena UI tidak bercampur dengan logika bisnis.

Testability: Logika bisnis dapat diuji secara unit test tanpa perlu UI. Misalnya, addToCart atau updateQuantity.

Reusability: Model data dapat digunakan di banyak halaman atau fitur berbeda, sementara Cubit bisa dipakai di UI yang berbeda.

Scalability: Memudahkan pengembangan aplikasi besar dan kolaborasi tim.

Dengan pemisahan ini, UI hanya menampilkan state, Cubit/Bloc mengatur state, dan model mewakili data.

3. State yang Digunakan dalam CartCubit

Dalam CartCubit, beberapa state penting antara lain:

CartInitial: State awal saat keranjang kosong atau aplikasi baru dibuka. UI menampilkan “Keranjang kosong”.

CartUpdated: State ketika ada perubahan pada keranjang, misalnya menambah, menghapus, atau mengubah jumlah item. UI otomatis rebuild sesuai data terbaru.

CartLoading: State sementara saat melakukan operasi yang memerlukan waktu, seperti menyimpan data ke server. UI bisa menampilkan loading spinner.

CartError: State ketika terjadi kesalahan, misalnya gagal menambah item. UI menampilkan pesan error.

State-state ini memastikan UI bersifat reaktif dan selalu menampilkan data terbaru sesuai logika bisnis.
