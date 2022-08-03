import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class CryptoItem extends StatelessWidget {
  final String imagesrc;
  final String cryptoName;
  final double cryptoLastPrice;
  final double cryptochangePrice24;
  const CryptoItem(
      {Key? key,
      required this.imagesrc,
      required this.cryptoName,
      required this.cryptoLastPrice,
      required this.cryptochangePrice24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 10 / 100,
      width: width * 97 / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[200],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      imagesrc,
                      height: 50,
                      width: 35,
                    ),
                    SizedBox(
                      width: width * 1 / 100,
                    ),
                    Text(
                      cryptoName.substring(0, 3),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${cryptoLastPrice.toStringAsFixed(2)} \$',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: width * 5 / 100,
                ),
                Text(
                  '${cryptochangePrice24.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: cryptochangePrice24 < 0
                        ? Colors.redAccent
                        : const Color.fromARGB(255, 17, 189, 23),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
