import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statefull Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 40;
  bool like = false;

  void _incrementCounter() {
    setState(() {
      if (like == false) {
        _counter++;
        like = true;
      } else {
        _counter--;
        like = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                // Container için alttan 16 birim paddıng verir.
                padding: EdgeInsets.only(bottom: 16),
                // Images klasöründe ki 7.jpg adlı fotoğrafı ekran gösterir.
                child: Image.asset("images/7.jpg"),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  // Boşlukları bütün çocukların arasında dağıtır.
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Machu Picchu",
                          // Text`e kalınlık verir ve boyutunu belirler.
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Cusco, Peru",
                          // Text`in boyutunu belirler ve rengini değiştirir.
                          style: TextStyle(fontSize: 20, color: Colors.black26),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            // Buton özelliği alabilen ikonlar oluşturur.
                            IconButton(
                              icon:
                                  (like // bool değeri alan like değişkeninin değerine göre yıldızın görünümünü belirler.
                                      ? Icon(Icons.star)
                                      : Icon(Icons.star_border)),
                              // IconButton`nun rengini değiştirir.
                              color: Colors.red,
                              iconSize: 45, // İkona boyut verir.
                              // Basılı tutunca ipucu oluşmasını sağlar.
                              tooltip: "Star",
                              // İkona basıldığında çalışacak olan fonksiyonu çağırır.
                              onPressed: _incrementCounter,
                            ),
                            Text(
                              "$_counter", // Text girdi olarak değişken değer alır.
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(left: 36, right: 36, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.call),
                          color: Colors.blue,
                          iconSize: 30,
                          tooltip: "Call",
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                        Text(
                          "Call",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.near_me),
                          color: Colors.blue,
                          iconSize: 30,
                          tooltip: "Route",
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                        Text(
                          "Route",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.share),
                          color: Colors.blue,
                          iconSize: 30,
                          tooltip: "Share",
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                        Text(
                          "Share",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: <Widget>[
                        new Text(
                          "Machu Picchu, bugüne kadar çok iyi korunarak gelmiş olan bir"
                          " İnka antik şehridir. 7 Temmuz 2007 tarihinde Dünyanın "
                          "Yeni Yedi Harikası'ndan biri olarak seçilmiştir. And Dağları'nın"
                          " bir dağının zirvesinde, 2.430 m yükseklikte, Urubamba Vadisi "
                          "üzerinde kurulmuş olup Peru'nun Cusco şehrine 88 km mesafededir.",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
