import 'package:flutter/material.dart';

class PriceShower extends StatelessWidget {
  final String status;
  final double price;
  const PriceShower({Key? key, required this.status, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "\€ ",
                      style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      price.toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
          SizedBox(
            height: 17,
          )
        ],
      ),
    );
  }
}
