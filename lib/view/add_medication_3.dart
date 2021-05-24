import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'add_medication_2.dart';
import 'pill_box_added.dart';

enum Routine { Weekly, Monthly }

class AddMedication3 extends StatefulWidget {
  @override
  _AddMedication3State createState() => _AddMedication3State();
}

class _AddMedication3State extends State<AddMedication3> {
  Routine _schedule = Routine.Monthly;

  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;

  bool _hasBeenPressedSave = false;

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed1
                              ? Colors.black
                              : Colors.grey.shade200,
                        ),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressed1 = !_hasBeenPressed1;
                          });
                        },
                        child: Text(
                          'Once a Month',
                          style: TextStyle(
                            color: _hasBeenPressed1
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed2
                              ? Colors.black
                              : Colors.grey.shade200,
                        ),
                        onPressed: () {
                          setState(() {
                            _hasBeenPressed2 = !_hasBeenPressed2;
                          });
                        },
                        child: Text(
                          'Twice a Month',
                          style: TextStyle(
                            color: _hasBeenPressed2
                                ? Colors.white
                                : Colors.black54,
                          ),
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Select Date',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Select date on which you take your Monthly medicine',
                    style: TextStyle(fontSize: 10, color: Colors.black26),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () => _selectDate(context),
                      child: Text(
                        'Change Date',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
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
                  if(checked.isEmpty)
                    _hasBeenPressedSave = false;
                  else
                    _hasBeenPressedSave = true;
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
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
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
                      primary: Colors.grey.shade200,
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
