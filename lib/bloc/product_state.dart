part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<Product> products;
  final int length;

  const ProductState(this.products, this.length);

  @override
  List<Object?> get props => [products, length];
}
