import 'package:boozin/view/add_medication_1.dart';
import 'package:flutter/material.dart';

class PillBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottomOpacity: 0,
        centerTitle: true,
        title: Text(
          'Pill Box',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.2),
            Image.asset('assets/pills_1.png'),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              'Welcome to Pill Box, here you \n '
              ' can add your medication and set \n '
              ' a reminder for them.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              'Let us start with adding your \n '
              ' first medication.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: ElevatedButton(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          children: [
                            Text('Add Medication'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMedication1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
