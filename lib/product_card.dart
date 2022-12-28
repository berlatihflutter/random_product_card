import 'package:flutter/material.dart';

const Color firstColor = Color(0xffF44336);
const Color secondColor = Color(0xff4CAF50);

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      this.imageUrl = "",
      this.name = "",
      this.price = "",
      this.quantity = 0,
      required this.notification,
      required this.onAddCartTap,
      required this.onIncTap,
      required this.onDecTap});
  final String imageUrl;
  final String name;
  final String price;
  final int quantity;
  final String notification;
  final Function() onAddCartTap;
  final Function() onIncTap;
  final Function() onDecTap;
  final TextStyle textStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[800]);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 10, right: 10),
          duration: const Duration(milliseconds: 300),
          width: 130,
          height: (notification.isNotEmpty) ? 270 : 250,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  offset: const Offset(1, 1),
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: secondColor),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              (notification.isNotEmpty) ? notification : "",
              style: textStyle.copyWith(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(1, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover)),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    name,
                    style: textStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    price,
                    style: textStyle.copyWith(
                      fontSize: 12,
                      color: firstColor,
                    ),
                  ),
                )
              ]),
              Column(
                children: [
                  Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: firstColor,
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onIncTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: onDecTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: const Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: onAddCartTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: firstColor,
                        elevation: 3,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16))),
                      ),
                      child: const Icon(
                        Icons.add_shopping_cart,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
