import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'pill_box.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '0', _steps = '0';

  void onStepCount(StepCount event) {
    /// Handle step count changed
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    /// Handle status changed
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    /// Handle the error
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    /// Handle the error
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  Future<void> initPlatformState() async {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  /// onPressed action need to be added for increment of the counter
  /// https://medium.com/@ayushbherwani/notification-badge-in-flutter-c776a6194936#:~:text=The%20variable%20counter%20will%20keep,and%20a%20Floating%20Action%20Button.

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottomOpacity: 0,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'Hi!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            counter = 0;
                          });
                        }),
                  ),
                  counter != 0
                      ? Positioned(
                          right: 30,
                          top: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minHeight: 14,
                              minWidth: 14,
                            ),
                            child: Text(
                              '$counter',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Container()
                ],
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 20),
                      child: Row(
                        children: [
                          Text(
                            'Steps: ',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            _steps,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    /// FOR LinearPercentIndicator
                    /// https://pub.dev/packages/percent_indicator
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: LinearPercentIndicator(
                        lineHeight: 20,
                        percent: int.parse(_steps)/15000,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                      child: Row(
                        children: [
                          Text(
                            '0 ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            'Goal: 15,000',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 0, 20),
                      child: Row(
                        children: [
                          Text(
                            'Calories Burned: ',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            (0.063*int.parse(_steps)).toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    /// FOR LinearPercentIndicator
                    /// https://pub.dev/packages/percent_indicator
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: LinearPercentIndicator(
                        lineHeight: 20,
                        percent: (0.063*int.parse(_steps))/1000,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                      child: Row(
                        children: [
                          Text(
                            '0 ',
                            style: TextStyle(fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            'Goal: 1000',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      children: [
                        Text(
                          'Pill Box',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Spacer(),
                        IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PillBox()),
                              );
                            })
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 40)
                ]),
              )
            ],
          ),
        ));
  }
}
