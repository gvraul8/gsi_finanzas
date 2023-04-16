import 'package:flutter/material.dart';

class CardData{
  final String balance;
  final String date;
  final String number;
  final Color color;
  final String image;

  CardData({required this.balance, required this.date, required this.number, required this.color, required this.image});
}

List<CardData> cards = [
  CardData(
    balance: '12,345',
    date: '03/24',
    number: '2345',
    color: Colors.blue,
    image: 'assets/masterCard.png'
  ),

  CardData(
    balance: '1,581',
    date: '07/25',
    number: '1578',
    color: Colors.red,
    image: 'assets/masterCard.png'
  ),

  CardData(
    balance: '22,149',
    date: '03/28',
    number: '3479',
    color: Colors.green,
    image: 'assets/masterCard.png'
  ),

  CardData(
    balance: '57,345',
    date: '12/24',
    number: '2675',
    color: Colors.yellow,
    image: 'assets/masterCard.png'
  ),
];


