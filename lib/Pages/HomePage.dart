import 'package:crypto_tracker/Models/CryptoCurrency.dart';
import 'package:crypto_tracker/Providers/marketProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Crypto Today',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Consumer<MarketProvider>(
                    builder: (context, marketProvider, child) {
                      if (marketProvider.isLoading == true) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (marketProvider.markets.length > 0) {
                          return ListView.builder(
                            physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()
                            ),

                              itemCount: marketProvider.markets.length,
                              itemBuilder: (context,index){
                                CryptoCurrency currentCrypto = marketProvider.markets[index];
                                return ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(currentCrypto.image!),

                                  ),
                                  title: Text(currentCrypto.name! +" #${currentCrypto.marketCapRank!}",style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Text(currentCrypto.symbol!.toUpperCase()),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('PKR '+currentCrypto.currentPrice!.toString(),style: TextStyle(fontSize: 16,color: Color(0xff0395eb)),),
                                   Builder(builder: (context){
                                     double priceChange = currentCrypto.priceChange24!;
                                     double priceChangePercentage = currentCrypto.priceChangePercentage24!;

                                     if(priceChange < 0){
                                       //negative
                                       return Text("${priceChangePercentage.toStringAsFixed(2)}% (${priceChange.toStringAsFixed(4)})",style: TextStyle(
                                         color: Colors.red
                                       ),);

                                     }else{
                                       //positive
                                       return Text("+${priceChangePercentage.toStringAsFixed(2)}% (+${priceChange.toStringAsFixed(4)})",style: TextStyle(
                                           color: Colors.green
                                       ),);

                                     }
                                   })
                                    ],
                                  ),
                                );

                          });
                        } else {
                          return Center(
                            child: Image.asset('assets/images/inter.png',height: 300,width: 300,),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
