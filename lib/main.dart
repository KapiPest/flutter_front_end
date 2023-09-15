import 'package:first_project/dashboard_page.dart';
import 'package:first_project/discover.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My App',
    initialRoute: '/',
    routes: {
    '/': (context) => HomeScreen(), // Define 'HomeScreen' route
    '/dashboard': (context) => DashboardPage(),
      },
    );

  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
                   context: context, 
                   builder: (context) {
                    return AlertDialog(
                      title: Text("Alert",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
              ),
                      content: Text("Do you want to Exit?", 
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),),
                      actions: [
                        ElevatedButton(onPressed: () => Navigator.of(context).pop(false), 
                        child: const Text("No"),
                        ),
                        ElevatedButton(onPressed: () => Navigator.of(context).pop(true), 
                        child: const Text("Exit"),
                        ),
                      ],
                    );
                  }
                );
          if (value !=null) {
            return Future.value(value);
          } else {
            return Future.value(false);
          }
      },

    child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/blue_gradient_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 75,
              left: 90,
              child: Image.asset(
                "images/realm_text.png",
                width: 250,
                height: 250,
              ),
            ),
            Positioned(
              top: 245,
              left: 60,
              child: Text(
                "Real-Time AquaLert Monitoring",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 350,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const DashboardPage(),
                  ));
                },
                child: SizedBox(
                  width: 370,
                  height: 130,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(247, 247, 247, 255),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              "images/dashboard_icon.png",
                              height: 75,
                              width: 75,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DASHBOARD",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 7, 155, 150),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Keeping your water usage in \ncheck, one dashboard at a time",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 500,
              left: 30,
               child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const DiscoverPage(),
                  ));
                },
              child: SizedBox(
                width: 370,
                height: 130,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(247, 247, 247, 255),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              "images/discover.png",
                              height: 75,
                              width: 75,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DISCOVER",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 7, 155, 150),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Stay ahead of water quality \ninformation",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
