import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../dataset.dart';

class LastInvestment extends StatelessWidget {
  calculatePie(int value) {
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: 125,
                height: 220,
                child: Stack(
                  children: [
                    Positioned(
                        child: PieChart(PieChartData(sections: [
                      PieChartSectionData(
                          value: calculatePie(2500),
                          color: Colors.red,
                          radius: 18,
                          showTitle: false),
                      PieChartSectionData(
                          value: calculatePie(1000),
                          color: Colors.blue,
                          radius: 18,
                          showTitle: false),
                      PieChartSectionData(
                          value: calculatePie(750),
                          color: Colors.green,
                          radius: 18,
                          showTitle: false),
                      PieChartSectionData(
                          value: calculatePie(500),
                          color: Colors.yellow,
                          radius: 18,
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
                      const Icon(Icons.trip_origin,
                          color: Colors.red, size: 12),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Banco Santander SA',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text('2500' + '€',
                              style: TextStyle(color: Colors.black54)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.trip_origin,
                          color: Colors.blue, size: 12),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Amazon.com INC',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text('1000' + '€',
                              style: TextStyle(color: Colors.black54)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.trip_origin,
                          color: Colors.green, size: 12),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tesla INC',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text('750' + '€',
                              style: TextStyle(color: Colors.black54)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.trip_origin,
                          color: Colors.yellow, size: 12),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Microsoft CORP',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text('500' + '€',
                              style: TextStyle(color: Colors.black54)),
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
