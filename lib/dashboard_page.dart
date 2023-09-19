import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifications_page.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: DashboardPage(),
  ));
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => DashboardPageState();
}

final now = DateTime.now();
var time = DateFormat('MM-dd-yyyy').format(now);

class DashboardPageState extends State<DashboardPage> {
  double temperatureValue = 0;
  double ntuValue = 0;
  double phValue = 0;
  late io.Socket socket;
  late Timer dataFetchTimer;

  // SharedPreferences instance
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    initializeSocket();

    // Initialize SharedPreferences
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;

      // Load last fetched values from SharedPreferences
      loadLastFetchedValues();

      // Start a periodic timer to fetch initial data every 1 second
      dataFetchTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
        fetchDataFromAPI();
      });
    });
  }

  void initializeSocket() {
    // Initialize Socket.IO and connect to the server
    socket = io.io('https://realm-admin.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    // Listen for 'temperature_update' events from the server
    socket.on('temperature_update', (data) {
      setState(() {
        temperatureValue = data['temperature_value'].toDouble();
      });
    });

    // Listen for 'ntu_update' events from the server
    socket.on('ntu_update', (data) {
      setState(() {
        ntuValue = data['ntu_value'].toDouble();
      });
    });

    // Listen for 'ph_update' events from the server
    socket.on('ph_update', (data) {
      setState(() {
        phValue = data['ph_value'].toDouble();
      });
    });

    // Connect to the server
    socket.connect();
  }

  // Function to load last fetched values from SharedPreferences
  void loadLastFetchedValues() {
    if (_prefs.containsKey('last_temperature')) {
      setState(() {
        temperatureValue = _prefs.getDouble('last_temperature') ?? -1.0;
      });
    }

    if (_prefs.containsKey('last_ntu')) {
      setState(() {
        ntuValue = _prefs.getDouble('last_ntu') ?? -1.0;
      });
    }

    if (_prefs.containsKey('last_ph')) {
      setState(() {
        phValue = _prefs.getDouble('last_ph') ?? -1.0;
      });
    }
  }

  // Update SharedPreferences with the latest values
  void updateLastFetchedValues() {
    _prefs.setDouble('last_temperature', temperatureValue);
    _prefs.setDouble('last_ntu', ntuValue);
    _prefs.setDouble('last_ph', phValue);
  }

  Future<void> fetchDataFromAPI() async {
    try {
      final temperatureResponse = await http.get(Uri.parse('https://realm-admin.onrender.com/api/realm/gettemp'));
      final ntuResponse = await http.get(Uri.parse('https://realm-admin.onrender.com/api/realm/getturbidity'));
      final phResponse = await http.get(Uri.parse('https://realm-admin.onrender.com/api/realm/getph'));

      if (temperatureResponse.statusCode == 200 &&
          ntuResponse.statusCode == 200 &&
          phResponse.statusCode == 200) {
        final temperatureJson = jsonDecode(temperatureResponse.body);
        final ntuJson = jsonDecode(ntuResponse.body);
        final phJson = jsonDecode(phResponse.body);

        setState(() {
          temperatureValue = temperatureJson[0]['temperature_value'].toDouble();
          ntuValue = ntuJson[0]['ntu_value'].toDouble();
          phValue = phJson[0]['ph_value'].toDouble();
        });

        // Update SharedPreferences with the latest values
        updateLastFetchedValues();

        print('Data fetched successfully: Temp=$temperatureValue, NTU=$ntuValue, pH=$phValue');
      } else {
        print('HTTP Error');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void dispose() {
    // Cancel the dataFetchTimer when the widget is disposed
    dataFetchTimer.cancel();

    // Close the Socket.IO connection
    socket.disconnect();

    super.dispose();
  }
  
 String getTemperatureStatus(double temperatureValue) {
  if (temperatureValue >= 36) {
    return "HIGH";
  } else if (temperatureValue >= 26) {
    return "CONDITIONAL";
  } else if (temperatureValue > 10) {
    return "NORMAL";
  } else {
    return "NORMAL";
  }
}

Color getTemperatureColor(double temperatureValue) {
  if (temperatureValue >= 36) {
    return Color.fromARGB(244, 255, 0, 0);
  } else if (temperatureValue >= 26) {
    return Color.fromARGB(255, 254, 219, 91);
  } else {
    return const Color(0xFF079B96);
  }
}

String getTurbidityStatus(double ntuValue) {
  if (ntuValue >= 10) {
    return "HIGH";
  } else if (ntuValue >= 6) {
    return "CONDITIONAL";
  } else if (ntuValue > 1) {
    return "NORMAL";
  } else {
    return "NORMAL";
  }
}

Color getTurbidityColor(double ntuValue) {
  if (ntuValue >= 10) {
    return Color.fromARGB(244, 255, 0, 0);
  } else if (ntuValue >= 6) {
    return Color.fromARGB(255, 254, 219, 91);
  } else {
    return const Color(0xFF079B96);
  }
}

String getPhStatus(double phValue) {
  if (phValue >= 11) {
    return "HIGH";
  } else if (phValue >= 8.6) {
    return "CONDITIONAL";
  } else if (phValue > 3.7) {
    return "NORMAL";
  } else if (phValue > 1) {
    return "POOR";
  } else {
    return "POOR";
  }
}

Color getPhColor(double phValue) {
  if (phValue >= 11) {
    return Color.fromARGB(244, 255, 0, 0);
  } else if (phValue >= 8.6) {
    return Color.fromARGB(255, 254, 219, 91);
  } else if (phValue >= 3.7) {
    return const Color(0xFF079B96);
  } else if (phValue >= 1) {
    return const Color(0xFFFDAB59);
  } else {
    return const Color(0xFFFDAB59);
  }
}


/*
final now = DateTime.now();
var time = DateFormat('MM-dd-yyyy').format(now);

*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/');
        return true;
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
                top: 60,
                left: 40,
                child: Text(
                  "Dashboard",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 62,
                left: 330,
                child: Stack(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotificationsPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 2,
                        shadowColor: Colors.grey.withOpacity(0.5),
                      ),
                      child: Row(
                        children: [ 
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Image.asset(
                              "images/doorbell.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Positioned(
                top: 130,
                left: 40,
                child: Container(
                  height: 250,
                  width: 370,
                  child: Image.asset(
                    "images/dashboard_data.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 30,
                child: Container(
                  height: 130,
                  width: 375,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(247, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 35,
                        left: 40,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(247, 231, 231, 231),
                          ),
                          child: const Text(
                            "Status Today",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 77, 179, 176),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 45,
                        child: Text(
                          time,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(247, 70, 70, 70),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 50,
                        left: 240,
                        child: Text(
                          "SAFE",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(247, 70, 70, 70),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 460,
                left: 0,
                child: Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: 160,
                        width: 180,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(247, 247, 247, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 7, 155, 150),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              child: Text(
                                '${temperatureValue.toStringAsFixed(1)}' + ' c',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 77, 77, 77),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 80,
                              child: Text(
                                getTemperatureStatus(temperatureValue.toDouble()),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: getTemperatureColor(temperatureValue.toDouble()),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 123,
                              child: Text(
                                "TEMPERATURE",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 160,
                        width: 180,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(247, 247, 247, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 7, 155, 150),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              child: Text(
                                '${ntuValue.toStringAsFixed(1)}' + ' NTU',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 77, 77, 77),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 80,
                              child: Text(
                                getTurbidityStatus(ntuValue.toDouble()),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: getTurbidityColor(ntuValue.toDouble()),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 123,
                              child: Text(
                                "TURBIDITY",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 160,
                        width: 180,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(247, 247, 247, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 7, 155, 150),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              child: Text(
                                '${phValue.toStringAsFixed(1)}' + " pH",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 77, 77, 77),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 80,
                              child: Text(
                                getPhStatus(phValue.toDouble()),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: getPhColor(phValue.toDouble()),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 123,
                              child: Text(
                                "Ph",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
