import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  // A static method to fetch market data asynchronously
  static Future<List<dynamic>> getMarket() async {
    try {
      // Define the API endpoint URL using the Coingecko API
      Uri requestPath = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=pkr&order=market_cap_desc&per_page=50&page=1&sparkline=false&locale=en');

      // Send a GET request to the specified URL
      var response = await http.get(requestPath);

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // The response is in the form of JSON. Decode the JSON response to Dart objects
        var decodeResponse = jsonDecode(response.body);

        // The decoded response is expected to be a List<dynamic> representing market data
        List<dynamic> markets = decodeResponse as List<dynamic>;

        // Return the list of market data to the caller
        return markets;
      } else {
        // If the request was not successful, throw an exception with the status code and reason
        throw Exception(
            'Failed to load market data: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      // Catch any general exception that might occur during the request
      print('Error fetching market data: $e');
      throw Exception('Failed to load market data. Please try again later.');
    }
  }
}
