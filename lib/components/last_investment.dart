import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../dataset.dart';

class LastInvestment extends StatelessWidget {
  calculatePie(int value) {
    // int total = lastInvestment[0].value +
    //     lastInvestment[1].value +
    //     lastInvestment[2].value;
    double result = (value / 12345) * 100;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(top: 20),
        width: 350,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),

        /////////////////////////////////////////////////////////////
        ///             DATOS DE LA TARJETA
        /////////////////////////////////////////////////////////////
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Últimas Inversiones',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: 100,
                height: 220,
                child: Stack(
                  children: [
                    Positioned(
                        child: PieChart(PieChartData(sections: [
                          PieChartSectionData(
                              value: calculatePie(1234),
                              color: Colors.red,
                              radius: 16,
                              showTitle: false),
                          PieChartSectionData(
                              value: calculatePie(568),
                              color: Colors.blue,
                              radius: 16,
                              showTitle: false),
                          PieChartSectionData(
                              value: calculatePie(123),
                              color: Colors.green,
                              radius: 16,
                              showTitle: false),
                    ])))

                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.trip_origin, color: Colors.blue, size: 12),
                      const SizedBox(width: 4,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const Text('Twitter',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 3,),
                      const Text('1000'+'€',
                          style: TextStyle(color: Colors.black54)),

                        ],
                      )

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.trip_origin, color: Colors.blue, size: 12),
                      SizedBox(width: 4,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Twitter',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 3,),
                      Text('1000'+'€',
                          style: const TextStyle(color: Colors.black54)),

                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.trip_origin, color: Colors.blue, size: 12),
                      SizedBox(width: 4,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Twitter',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(height: 3,),
                      Text('1000'+'€',
                          style: const TextStyle(color: Colors.black54)),

                        ],
                      )

                    ],
                  )
                ],
              )
            ]),
          ],
        ));
  }
}
