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

  CryptoCurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24,
    required this.low24,
    required this.priceChange24,
    required this.priceChangePercentage24,
    required this.circulatingSupply,
    required this.ath,
    required this.at1,
  });

  factory CryptoCurrency.fromJSON(Map<String, dynamic> map) {
    return CryptoCurrency(
      id: map["id"],
      symbol: map["symbol"],
      name: map["name"],
      image: map["image"],
      currentPrice: (map["current_price"] as num?)?.toDouble(),
      marketCap: (map["market_cap"] as num?)?.toDouble(),
      marketCapRank: (map["market_cap_rank"] as num?)?.toInt(),
      high24: (map["high_24"] as num?)?.toDouble(),
      low24: (map["low_24"] as num?)?.toDouble(),
      priceChange24: (map["price_change_24h"] as num?)?.toDouble(),
      priceChangePercentage24: (map["price_change_percentage_24h"] as num?)
          ?.toDouble(),
      circulatingSupply: (map["circulating_supply"] as num?)?.toDouble(),
      ath: (map["ath"] as num?)?.toDouble(),
      at1: (map["at1"] as num?)?.toDouble(),
    );
  }
  }