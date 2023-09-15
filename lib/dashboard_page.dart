import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifications_page.dart';
import 'package:intl/intl.dart';

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

String getTemperatureStatus(double temp) {
  if (temp >= 36) {
    return "HIGH";
  } else if (temp >= 26) {
    return "CONDITIONAL";
  } else if (temp > 10) {
    return "NORMAL";
  } else {
    return "NORMAL";
  }
}

Color getTemperatureColor(double temp) {
  if (temp >= 36) {
    return Color.fromARGB(244, 255, 0, 0);
  } else if (temp >= 26) {
    return Color.fromARGB(255, 254, 219, 91);
  } else {
    return const Color(0xFF079B96);
  }
}

String getTurbidityStatus(double turbs) {
  if (turbs >= 10) {
    return "HIGH";
  } else if (turbs >= 6) {
    return "CONDITIONAL";
  } else if (turbs > 1) {
    return "NORMAL";
  } else {
    return "NORMAL";
  }
}

Color getTurbidityColor(double turbs) {
  if (turbs >= 10) {
    return Color.fromARGB(244, 255, 0, 0);
  } else if (turbs >= 6) {
    return Color.fromARGB(255, 254, 219, 91);
  } else {
    return const Color(0xFF079B96);
  }
}

String getPhStatus(double pH) {
  if (pH >= 11) {
    return "HIGH";
  } else if (pH >= 8.6) {
    return "CONDITIONAL";
  } else if (pH > 3.7) {
    return "NORMAL";
  } else if (pH > 1) {
    return "POOR";
  } else {
    return "NORMAL";
  }
}

Color getPhColor(double pH) {
  if (pH >= 11) {
    return Color.fromARGB(244, 255, 0, 0);
  } else if (pH >= 8.6) {
    return Color.fromARGB(255, 254, 219, 91);
  } else if (pH >= 3.7) {
    return const Color(0xFF079B96);
  } else if (pH >= 1) {
    return const Color(0xFFFDAB59);
  } else {
    return const Color(0xFFFDAB59);
  }
}

final now = DateTime.now();
var time = DateFormat('MM-dd-yyyy').format(now);
var temp = 18;
var turbs = 7;
var pH = 7.2;

class DashboardPageState extends State<DashboardPage> {
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

                    Positioned( // Notification Number
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Text(
                            "10", // You can change this to the actual number of notifications
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
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
                                temp.toString() + " c",
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
                                getTemperatureStatus(temp.toDouble()),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: getTemperatureColor(temp.toDouble()),
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
                                turbs.toString() + " NTU",
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
                                getTurbidityStatus(turbs.toDouble()),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: getTurbidityColor(turbs.toDouble()),
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
                                pH.toString() + " pH",
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
                                getPhStatus(pH.toDouble()),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: getPhColor(pH.toDouble()),
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
