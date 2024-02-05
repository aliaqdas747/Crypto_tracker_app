import 'dart:async';

import 'package:crypto_tracker/Models/Api.dart';
import 'package:crypto_tracker/Models/CryptoCurrency.dart';
import 'package:flutter/material.dart'; // Change import to flutter/material.dart

// A provider class for managing market-related data
class MarketProvider with ChangeNotifier {
  // Boolean flag to indicate whether data is currently being loaded
  bool isLoading = true;

  // List to store CryptoCurrency objects representing market data
  List<CryptoCurrency> markets = [];

  MarketProvider() {
    fetchData();
  }

  // Method to fetch market data asynchronously
  void fetchData() async {
    // Use the API class to get market data
    List<dynamic> _markets = await API.getMarket();

    // Temporary list to store CryptoCurrency objects
    List<CryptoCurrency> temp = [];

    // Loop through the retrieved market data and convert each entry to a CryptoCurrency object
    for (var market in _markets) {
      // Create a new CryptoCurrency object from the JSON representation
      CryptoCurrency newCrypto = CryptoCurrency.fromJSON(market);
      // Add the new CryptoCurrency object to the temporary list
      temp.add(newCrypto);
    }

    // Update the markets list with the converted CryptoCurrency objects
    markets = temp;

    // Set isLoading to false to indicate that data loading is complete
    isLoading = false;

    // Notify any listeners (typically UI components) that the data has been updated
    notifyListeners();

    Timer(const Duration(seconds: 3),(){
      fetchData();
      print('data updated');
    });
  }
}
