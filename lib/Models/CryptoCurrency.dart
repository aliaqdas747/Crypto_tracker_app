class CryptoCurrency {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  int? marketCapRank;
  double? high24;
  double? low24;
  double? priceChange24;
  double? priceChangePercentage24;
  double? circulatingSupply;
  double? ath;
  double? at1;

  CryptoCurrency(
  {required this.id,required this.symbol,required this.name,
    required this.image,required this.currentPrice,required this.marketCap,
    required this.marketCapRank, required this.high24,required this.low24,
    required this.priceChange24,required this.priceChangePercentage24,
    required this.circulatingSupply,required this.ath,required this.at1
  });
  factory CryptoCurrency.fromJSON(Map<String, dynamic> map){
    return CryptoCurrency(id: map["id"], symbol: map["symbol"], name: map["name"], image: map["image"], currentPrice: map["current_price"],
        marketCap: map["market_cap"], marketCapRank: map["market_cap_rank"], high24: map["high_24"], low24: map["low_24"],
        priceChange24: map["price_change_24h"], priceChangePercentage24: map["price_change_percentage_24h"],
        circulatingSupply: map["circulating_supply"], ath: map["ath"], at1: map["at1"]);
  }
}