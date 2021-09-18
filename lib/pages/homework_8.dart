import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWork8 extends StatefulWidget {
  const HomeWork8({Key? key}) : super(key: key);

  @override
  _HomeWork8State createState() => _HomeWork8State();
}

class _HomeWork8State extends State<HomeWork8> {
  var number;

  Widget _Button1(int n) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              number = n;
            });
          },
          child: Text(
            'chakraPetch',
            style: TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }

  Widget _Button2(int n) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              number = n;
            });
          },
          child: Text(
            'charm',
            style: TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }

  Widget _Button3(int n) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              number = n;
            });
          },
          child: Text(
            'pattaya',
            style: TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }

  Widget _Button4(int n) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              number = n;
            });
          },
          child: Text(
            'thasadith',
            style: TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }

  Widget _Button5(int n) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              number = n;
            });
          },
          child: Text(
            'koHo',
            style: TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THAI FONT VIEWER'),
      ),
      body: Container(
        color: Colors.red[50],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'การเดินทางขากลับคงจะเหงาน่าดู',
                        textAlign: TextAlign.center,
                        style: number == 2
                            ? GoogleFonts.charm(
                                textStyle: TextStyle(fontSize: 70.0),
                              )
                            : number == 3
                                ? GoogleFonts.pattaya(
                                    textStyle: TextStyle(fontSize: 70.0),
                                  )
                                : number == 4
                                    ? GoogleFonts.thasadith(
                                        textStyle: TextStyle(fontSize: 70.0),
                                      )
                                    : number == 5
                                        ? GoogleFonts.koHo(
                                            textStyle:
                                                TextStyle(fontSize: 70.0),
                                          )
                                        : GoogleFonts.chakraPetch(
                                            textStyle:
                                                TextStyle(fontSize: 70.0),
                                          ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    number == 2
                        ? Text('Font: charm')
                        : number == 3
                            ? Text('Font: pattaya')
                            : number == 4
                                ? Text('Font: thasadith')
                                : number == 5
                                    ? Text('Font: koHo')
                                    : Text('Font: chakraPetch'),
                    Card(
                      elevation: 5.0,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          _Button1(1),
                          _Button2(2),
                          _Button3(3),
                          _Button4(4),
                          _Button5(5),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// https://github.com/tiwarin42/mobileHomework/blob/master/lib/pages/homework_8.dart
