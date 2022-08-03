// To parse this JSON data, do
//

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';

List<CryptoService> cryptoServiceFromJson(String str) =>
    List<CryptoService>.from(
        json.decode(str).map((x) => CryptoService.fromJson(x)));

String cryptoServiceToJson(List<CryptoService> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CryptoService {
  CryptoService({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24H,
  });

  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double priceChangePercentage24H;

  factory CryptoService.fromJson(Map<String, dynamic> json) => CryptoService(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "price_change_percentage_24h": priceChangePercentage24H,
      };
}

class GetCryptoListService {
  Future<List<CryptoService>> getCryptoList([int startIndex = 0]) async {
    final response = await get(Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false"));
    final myCryptos = cryptoServiceFromJson(response.body);
    return myCryptos;
  }
}
