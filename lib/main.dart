import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:TicTacToeGameApp/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var myNewWhiteFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 3, fontSize: 15)
  );

  var myNewBlackFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black,letterSpacing: 8, fontSize: 15)
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:100),
                  child: Container(
                    //color: Colors.red,
                    child: Text("TIC TAC TOE",
                      style: myNewWhiteFont,
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    //color: Colors.yellow,
                    child: Image.asset("assets/images/Tic_tac_toe.png"),
                  ),
                ),
              ),
              Container(
                //width: double.infinity,
                width: 200,
                padding: EdgeInsets.only(top: 50.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      )
                    );
                  },
                  child: Text("PLAY",
                    style: myNewBlackFont 
                  ),
                  color: Colors.white,
                  textColor: Colors.blue,
                  highlightColor: Colors.blue[200],
                  //splashColor: Colors.green,
                  elevation: 10.0,
                  highlightElevation: 5.0,
                  padding: EdgeInsets.all(15.0),
                  //shape: Border.all(width: 2.0, color: Colors.orange)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //color: Colors.orange,
                  alignment: Alignment.center,
                  child: Text("@CREATEDBYSHUBHAM",
                    style: myNewWhiteFont,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
