import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  // A static method to fetch market data asynchronously
  static Future<List<dynamic>> getMarket() async {
    // Define the API endpoint URL using the Coingecko API
    Uri requestPath = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=pkr&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en");

    // Send a GET request to the specified URL
    var response = await http.get(requestPath);

    // The response is in the form of JSON. Decode the JSON response to Dart objects
    var decodeResponse = jsonDecode(response.body);

    // The decoded response is expected to be a List<dynamic> representing market data
    List<dynamic> markets = decodeResponse as List<dynamic>;

    // Return the list of market data to the caller
    return markets;
  }
}
