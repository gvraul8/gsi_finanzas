import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gsi_finanzas/models/quote_model.dart';
import 'package:gsi_finanzas/services/finnhub_service.dart';
import '../components/quotes_list_tile.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  late Timer _timer;
  List<Quote>? _quotes;
  final FinnhubService _client = FinnhubService();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy'); // Formato de fecha
  final DateFormat _timeFormat = DateFormat('HH:mm:ss'); // Formato de hora
  String currentDate = '';
  String currentTime = '';

  @override
  void initState() {
    _getQuotes(); // Obtener los datos al iniciar el widget
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      // Actualizar los datos cada 30 segundos
      _getQuotes();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancelar el timer cuando el widget se dispose
    super.dispose();
  }

  Future<void> _getQuotes() async {
    final List<Quote>? quotes = await _client.getQuotes();

    setState(() {
      _quotes = quotes;
      currentDate = _dateFormat.format(DateTime.now());
      currentTime = _timeFormat.format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF020060),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Precios'),
            Text(
              'Última actualización: $currentDate $currentTime',
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      body: _quotes != null
          ? ListView.builder(
              itemCount: _quotes!.length,
              itemBuilder: (context, index) =>
                  QuotesListTile(_quotes![index], context),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
