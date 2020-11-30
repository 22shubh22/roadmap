import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  // AnimationController _controller;

    Map data = {
      'cities_count': 7,
    'cities': ['Korba', 'Katghora', 'Chotiya', 'Prem Nagar', 'Udaipur', 'Lakhanpur', 'Ambikapur'],
    'distance_span' : 173,
    'distances': [0.0, 32.5, 70.2, 105.0, 131.0, 151.0, 173.0],
    'current_location': 49.0,
  };

  List<Widget> stack_items = [
            Container(width: double.maxFinite, height: 20,color: Colors.transparent,),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
              // padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: 21,
                height: 1730,
              ),
            ),
            Positioned(
      top: 53.0,
      left: 20,
      child: Text('Start', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),),
    ),
            CityLocations(53.0),
            CityNames(53.0, 'Rohtak Nagar'),
            CityLocations(152.0),
            CityNames(152.0, 'Jehl Panah'),
            CityLocations(352.0),
            CityNames(352.0, 'Dogi'),
            CityLocations(952.0),
            CityNames(952.0, 'Yazur Cantt'),
            CityLocations(1552.0),
            CityNames(1552.0, 'PrateekNagar'),
            CityLocations(1730.0),
            CityNames(1730.0, 'KartarPur Dogra'),
            Positioned(
      top: 1730.0,
      left: 20,
      child: Text('Destination', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),),
    ),
            // CurrentLocation(_controller.value*1670 + 50),
            Positioned(
      top: 100.0,
      left: 20,
      child: Text('Current', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),),
    ),
          ];

  @override
  void initState() {
    super.initState();

    // _controller = AnimationController(vsync: this, duration: Duration(seconds: 21))
    // ..addListener(() {setState(() {
      
    // });});
    // _controller.forward();
    int count = data['cities_count'];
    for(int i;i<count;i++){
      stack_items.add(CityNames(data['distances'][i], data['cities'][i]),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI testing'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: stack_items,
        ),
      ),
    );
  }
}


  Widget CityLocations(top) {
    return Positioned(
      top: top,
      left: 103,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: 15,
        height: 15,
      ),
    );
  }

    Widget CurrentLocation(top) {
    return Positioned(
      top: top,
      left: 95,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[100],
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(
      color: Colors.blueAccent, //                   <--- border color
      width: 5.0,
    ),
        ),
        width: 30,
        height: 30,
      ),
    );
  }

      Widget CityNames(double top, String name) {
    return Positioned(
      top: top,
      left: 140,
      child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
    );
  }