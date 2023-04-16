import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

import '../dataset.dart';

class CardDesing extends StatelessWidget {
  final CardData card;
  const CardDesing({required this.card});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: card.color,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: card.color,
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
              /////////////////////////////////////////////////////////////
              ///             DECORACION DE LA TARJETA
              /////////////////////////////////////////////////////////////

          child: Stack(
            children: [
              Positioned(
                bottom: -50,
                left: -10,
                child: Blob.random(
                  size: 150,
                  styles: BlobStyles(
                    color: card.color.withGreen(1).withOpacity(0.2),
                  ),
                ),
              ),
              Positioned(
                top: -50,
                child: Blob.random(
                  size: 250,
                  styles: BlobStyles(
                    color: card.color.withGreen(1).withOpacity(0.2),
                  ),
                ),
              ),
              Positioned(
                top: -20,
                right: -100,
                child: Blob.random(
                  size: 300,
                  styles: BlobStyles(
                    color: card.color.withGreen(1).withOpacity(0.2),
                  ),
                ),
              ),

              /////////////////////////////////////////////////////////////
              ///             DATOS DE LA TARJETA
              /////////////////////////////////////////////////////////////

              Positioned(
                top: 30,
                left: 30,
                right: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Saldo disponible',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 5,),
                        Text(
                          card.date,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5,),
                    Text(
                      '\$${card.balance}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                )
              ),

              Positioned(
                bottom: 30,
                left: 30,
                right: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        Text(
                          '****${card.number}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      card.image,
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
