import 'package:flutter/material.dart';

import '../models/quote_model.dart';

Widget QuotesListTile(Quote quote, BuildContext context){
  Color changeColor = quote.changePercent < 0.00 ? Colors.red : Colors.green;
  IconData changeIcon = quote.changePercent < 0.00 ? Icons.arrow_downward : Icons.arrow_upward;

  return Container(
    margin: const EdgeInsets.all(12.0),
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
          spreadRadius: 1.0,
          offset: Offset(1.0, 1.0)
        )
      ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/symbols/${quote.icon}"), fit: BoxFit.fitWidth)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quote.symbol,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    quote.name,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$${quote.currentPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              width: 90,
              height: 25,
              padding: const EdgeInsets.only(left: 5, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: changeColor.withOpacity(0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    changeIcon,
                    color: Colors.black,
                  ),
                  Text(
                    "${quote.changePercent.toStringAsFixed(2)}%",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
