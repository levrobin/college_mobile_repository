import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout App',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // // Spacer для распределения пространства
          // const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.all(8),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/1200px-McDonald%27s_Golden_Arches.svg.png',
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child:
                    // AppBar(
                    // )
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: Text(
                        'Menu',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
              ),
            ],
          ),


          const Spacer(flex: 1),

          Center(
            child: RichText(
              text: TextSpan(
                text: 'Big Mac',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
              ),
            ),
          ),

          const Spacer(flex: 1),

          Center(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp72upWZ5XblXiUF2BTRZ6gjuVf2wnjZ6wEA&s',
            ),
          ),

          threeCircles(3, 10),

          const Spacer(flex: 1),

          Center(
            child: RichText(
              text: TextSpan(
                text: 'Nutritional information',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '550 cal.\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'calories',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 131, 57, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '30 G\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Total fan',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 131, 57, 0),
                        ),
                      ),

                      TextSpan(
                        text: '(30%)',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 131, 57, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              RotatedBox(
                quarterTurns: 3,
                child: RichText(
                  text: TextSpan(
                    text: 'Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: const Color.fromARGB(255, 131, 57, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '45 G\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Total Carbs',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 131, 57, 0),
                        ),
                      ),

                      TextSpan(
                        text: '(30% DV)',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 131, 57, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '25 G\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: 'Protein',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 131, 57, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 80,
        height: 80,
        padding: EdgeInsets.all(8),
        child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/1200px-McDonald%27s_Golden_Arches.svg.png',
        ),
      ),
      Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child:
            // AppBar(
            // )
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
      ),
    ],
  );
}

Widget burgerImg() {
  return Container();
}

Widget threeCircles(conut, size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(conut, (index) {
      return Container(
        margin: EdgeInsets.all(5),
        width: size,
        height: size,
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      );
    }),
  );
}

Widget myTable(title, description) {
  return Column(
    children: [
      // Row(
      //   children: [
      //     Container(
      //       child: ,
      //     ),
      //     Container(),
      //   ],
      // ),
      // Row(
      //   children: [
      //     Container(),
      //     Container(),
      //   ],
      // ),
    ],
  );
}

Widget verticalText() {
  return Container();
}
