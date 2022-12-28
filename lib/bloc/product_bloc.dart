import 'package:bloc/bloc.dart';
import 'package:bloc_listviewbuilder_2/model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState([], 0)) {
    on<ProductEvent>((event, emit) {
      List<Product> products = [];
      for (int i = 0; i < event.number; i++) {
        products.add(
          Product(
              name: "Produk $i",
              price: (i + 1) * 5000,
              imageUrl:
                  "https://cdn-prod.medicalnewstoday.com/content/images/articles/308/308796/mixed-fruits.jpg"),
        );
      }
      emit(ProductState(products, products.length));
    });
  }
}

//when PorductState is zero, state can recognize itself, 
//but when non-zero, cant recognize, 
//the property is List<Product> and int;
