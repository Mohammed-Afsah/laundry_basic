import '../product.dart'; // Assuming Product class is defined in product.dart

class CartItem {
  final Product product;
  final List<int> selectedServices;
  int quantity;

  CartItem({required this.product, required this.selectedServices, this.quantity = 1});
}