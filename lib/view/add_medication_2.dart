import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'add_medication_3.dart';
import 'pill_box_added.dart';

enum Routine { Weekly, Monthly }

class AddMedication2 extends StatefulWidget {
  @override
  _AddMedication2State createState() => _AddMedication2State();
}

class _AddMedication2State extends State<AddMedication2> {
  Routine _schedule = Routine.Weekly;

  bool _hasBeenPressedMon = false;
  bool _hasBeenPressedTue = false;
  bool _hasBeenPressedWed = false;
  bool _hasBeenPressedThu = false;
  bool _hasBeenPressedFri = false;
  bool _hasBeenPressedSat = false;
  bool _hasBeenPressedSun = false;

  bool _hasBeenPressedSave = false;

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
          'Add Medication',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Medicine Name',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter name of your medicine',
                      contentPadding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Select Medication routine',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),

            /// Radio button States
            /// https://material.io/develop/flutter/components/radio-buttons
            /// https://www.coderzheaven.com/2019/01/27/radio-radiolisttile-in-flutter-android-ios/
            /// https://pub.dev/packages/custom_radio_grouped_button
            /// https://morioh.com/p/bb72b518ae60
            /// https://fluttergems.dev/checkbox-radio-button/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RadioListTile(
                    value: Routine.Weekly,
                    groupValue: _schedule,
                    activeColor: Colors.black,
                    title: Text(
                      'Weekly',
                      style: TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.bold),
                    ),
                    onChanged: (Routine value) {
                      setState(() {
                        _schedule = value;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMedication2()),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Monthly',
                      style: TextStyle(
                          color: Colors.black38, fontWeight: FontWeight.bold),
                    ),
                    leading: Radio(
                      value: Routine.Monthly,
                      groupValue: _schedule,
                      activeColor: Colors.black,
                      onChanged: (Routine value) {
                        setState(() {
                          _schedule = value;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMedication3()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.01,
                ),
                SizedBox(
                  width: 45,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: _hasBeenPressedMon
                                ? Colors.black
                                : Colors.grey.shade200,
                            padding: EdgeInsets.all(0.0)),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressedMon = !_hasBeenPressedMon;
                          });
                        },
                        child: Text(
                          'Mon',
                          style: TextStyle(
                            color: _hasBeenPressedMon
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SizedBox(
                  width: 45,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: _hasBeenPressedTue
                                ? Colors.black
                                : Colors.grey.shade200,
                            padding: EdgeInsets.all(0.0)),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressedTue = !_hasBeenPressedTue;
                          });
                        },
                        child: Text(
                          'Tue',
                          style: TextStyle(
                            color: _hasBeenPressedTue
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SizedBox(
                  width: 45,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: _hasBeenPressedWed
                                ? Colors.black
                                : Colors.grey.shade200,
                            padding: EdgeInsets.all(0.0)),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressedWed = !_hasBeenPressedWed;
                          });
                        },
                        child: Text(
                          'Wed',
                          style: TextStyle(
                            color: _hasBeenPressedWed
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SizedBox(
                  width: 45,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: _hasBeenPressedThu
                                ? Colors.black
                                : Colors.grey.shade200,
                            padding: EdgeInsets.all(0.0)),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressedThu = !_hasBeenPressedThu;
                          });
                        },
                        child: Text(
                          'Thu',
                          style: TextStyle(
                            color: _hasBeenPressedThu
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SizedBox(
                  width: 45,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: _hasBeenPressedFri
                                ? Colors.black
                                : Colors.grey.shade200,
                            padding: EdgeInsets.all(0.0)),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressedFri = !_hasBeenPressedFri;
                          });
                        },
                        child: Text(
                          'Fri',
                          style: TextStyle(
                            color: _hasBeenPressedFri
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SizedBox(
                  width: 45,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: _hasBeenPressedSat
                                ? Colors.black
                                : Colors.grey.shade200,
                            padding: EdgeInsets.all(0.0)),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressedSat = !_hasBeenPressedSat;
                          });
                        },
                        child: Text(
                          'Sat',
                          style: TextStyle(
                            color: _hasBeenPressedSat
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                SizedBox(
                  width: 45,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: _hasBeenPressedSun
                                ? Colors.black
                                : Colors.grey.shade200,
                            padding: EdgeInsets.all(0.0)),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressedSun = !_hasBeenPressedSun;
                          });
                        },
                        child: Text(
                          'Sun',
                          style: TextStyle(
                            color: _hasBeenPressedSun
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Select time at which you take medicine',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'You can change the time to match your schedule.',
                    style: TextStyle(fontSize: 10, color: Colors.black26),
                  ),
                ),
              ],
            ),
            CheckboxGroup(
              labels: <String>[
                "Morning",
                "Afternoon",
                "Evening",
                "Night",
              ],
              onChange: (bool isChecked, String label, int index) {},
              onSelected: (List<String> checked) {
                setState(() {
                  _hasBeenPressedSave = !_hasBeenPressedSave;
                });
              },
              checkColor: Colors.black,
              activeColor: Colors.grey.shade50,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: Container(
                        child: Image.asset('assets/add_icon.png'),
                      )),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Text(
                    'Add new time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: ElevatedButton(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Save',
                            style: TextStyle(
                                color: _hasBeenPressedSave
                                    ? Colors.white
                                    : Colors.black54,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PillBoxAdded()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: _hasBeenPressedSave
                          ? Colors.black
                          : Colors.grey.shade200,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
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
