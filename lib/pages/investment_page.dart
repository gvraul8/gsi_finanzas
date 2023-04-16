import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Investment extends StatelessWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF020060),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Precios'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFF020060),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          Column(
            children: [Market(), Recomended(), Return()],
          )
        ],
      ),
    );
  }
}

class Return extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Return on Investment",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Graph(),
        ],
      ),
    );
  }
}

class Graph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: LineChart(LineChartData(
        minX: 0,
        maxX: 12,
        minY: 0,
        maxY: 12,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(showTitles: true),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 0),
              FlSpot(1, 1),
              FlSpot(2, 4),
              FlSpot(3, 1),
              FlSpot(4, 6),
              FlSpot(5, 5),
              FlSpot(6, 6),
              FlSpot(7, 8),
              FlSpot(8, 11),
              FlSpot(9, 9),
              FlSpot(10, 10),
              FlSpot(11, 8),
              FlSpot(12, 12),
            ],
            isCurved: true,
            colors: [
              const Color(0xff4af699),
            ],
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              colors: [
                const Color(0xff4af699).withOpacity(0.5),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class Recomended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Recomendados para ti',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Ver todos',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const RecomendedItem(
                  name: "Prueba",
                  subtitle: "Prueba",
                  value: "Prueba",
                  icon: "assets/masterCard.png"),
              const RecomendedItem(
                  name: "Prueba",
                  subtitle: "Prueba",
                  value: "Prueba",
                  icon: "assets/masterCard.png"),
              const RecomendedItem(
                  name: "Prueba",
                  subtitle: "Prueba",
                  value: "Prueba",
                  icon: "assets/masterCard.png"),
            ],
          )
        ],
      ),
    );
  }
}

class RecomendedItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final String value;
  final String icon;

  const RecomendedItem(
      {Key? key,
      required this.name,
      required this.subtitle,
      required this.value,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(icon), fit: BoxFit.cover)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Currency market',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Open chart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Currency(currency: "EUR/USD", value: "0.1"),
                const Currency(currency: "EUR/USD", value: "1.25"),
                const Currency(currency: "EUR/USD", value: "0.785"),
                const Currency(currency: "EUR/USD", value: "-0.1514"),
                const Currency(currency: "EUR/USD", value: "0.-236")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Currency extends StatelessWidget {
  final String currency;
  final String value;

  const Currency({Key? key, required this.currency, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isNegative = value.contains("-");
    final Color backgroundColor = isNegative ? Colors.red : Colors.green;

    return Container(
      margin: const EdgeInsets.all(7),
      width: 120,
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currency,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isNegative)
                const Icon(
                  Icons.trending_down,
                  color: Colors.black,
                )
              else
                const Icon(
                  Icons.trending_up,
                  color: Colors.black,
                ),
              Text(
                "$value%",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
