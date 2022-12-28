import 'dart:math';

import 'package:bloc_listviewbuilder_2/bloc/product_bloc.dart';
import 'package:bloc_listviewbuilder_2/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  Random r = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Listview Builder"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              print("Event Triggered");
              context.read<ProductBloc>().add(ProductEvent(r.nextInt(3)));
            },
            child: const Text("Tambah Product Card"),
          ),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            print("State Changed");
            return Expanded(
              child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: ((context, index) => ProductCard(
                        imageUrl: state.products[index].imageUrl,
                        name: state.products[index].name,
                        price: state.products[index].price.toString(),
                        notification: '',
                        onAddCartTap: () {},
                        onIncTap: () {},
                        onDecTap: () {},
                      ))),
            );
          }),
        ],
      ),
    );
  }
}
