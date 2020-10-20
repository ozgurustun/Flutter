import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List currencies;
  final List<MaterialColor> _colors = [Colors.orange, Colors.brown, Colors.red];

  @override
  void initState() async{
    super.initState();
    currencies = await getCurrencies();
  }

  Future<List> getCurrencies() async{
    String cryptoUrl = "https://api.coingecko.com/api/v3/exchanges";
    http.Response response = await http.get(cryptoUrl);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cryto App"),
      ),
      body: _cryptoWidget(),
    );
  }
  
  Widget _cryptoWidget(){
    return new Container(
      child: new Flexible(
          child: new ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (BuildContext context, int index){
                final Map currency = currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUi(currency, color);
              },
          ),
      ),
    );
  }

  Widget _getListItemUi(Map currency, MaterialColor color){
    return new ListTile(
      leading: new CircleAvatar(backgroundColor: color,
      child: new Text(currency['name'][0]),
      ),
      title: new Text(currency["name"],
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(
        currency['trade_volume_24h_btc'], currency['trade_volume_24h_btc_normalized'],
      ),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange){
    TextSpan priceTextWidget = new TextSpan(text: "\$$priceUSD", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if(double.parse(percentageChange) > 0 ){
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText, style: new TextStyle(color: Colors.green));
    }else{
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }
    return new RichText(
        text: new TextSpan(
         children: [priceTextWidget, percentageChangeTextWidget]
        )
    );
  }

}
