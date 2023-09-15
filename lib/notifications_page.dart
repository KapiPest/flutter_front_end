import 'package:first_project/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationsPage(),
    ) 
  );
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/blue_gradient_background.jpg"),
                fit: BoxFit.cover)
                ),

          child: Stack(
            children: [
              
            Positioned(
            top: 64,
            left: 30,
              child: SizedBox(
                width: 62, 
                height: 35, 
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardPage()),
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
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              "images/home_icon.png",
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    ),
  ),
),

              Positioned(
              top: 60,
              left: 110,
              child: Text(
                "Notifications",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: Center(
                child: Opacity(
                  opacity: 0.5,
                    child: Text(
                      "No Notifications Yet",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ), 
          ),
        ),
      ),
    ),
        ],
       ),
      ),
    );
  }
}
