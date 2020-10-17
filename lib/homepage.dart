import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //String displayXorO="";                                 //Har Jageh pe "0" set ho rha hai
  bool okiturn=true;

  List<String> displayXorO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];                                                       //ab Same variable ki list banayenge
  
  var myNewWhiteFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 3, fontSize: 15)
  );            

  int oScore=0;
  int xScore=0;       
  int filledboxes=0;             

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: <Widget>[
            Expanded(
              child:  Container(
                //color:Colors.red,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Player O", style: myNewWhiteFont),
                          SizedBox(height: 20),
                          Text(oScore.toString(), style: myNewWhiteFont),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Player X", style: myNewWhiteFont),
                          SizedBox(height: 20),
                          Text(xScore.toString(), style: myNewWhiteFont),
                        ],
                      ),
                    ],
                  )
                ),
              ) 
            ),
            Expanded(
              flex: 3,
                child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _containerTapped(index);
                    },
                    child: Container(                             //Container pe GestureDectector Lagayenge
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[700]),
                      ),
                      child: Center(
                        child: Text(                              //Text ko Container ke Center mein rakhne ke liye
                          //index.toString(),                     //To display Index
                          displayXorO[index],                     //Variable to display Blank Boxes
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child:  Center(
                child: Container(
                //color:Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("TIC TAC TOE",
                        style: myNewWhiteFont,
                      ),
                      Text("@CREATEDBYSHUBHAM",
                        style: myNewWhiteFont,
                      ),
                    ],
                  ),    
                ),
              ) 
            ),
          ],
        ),
      ),
    );
  }

  void _containerTapped(int index) {
    
    setState(() {
      if(okiturn && displayXorO[index] == '')
      {
        displayXorO[index]='O';
        filledboxes+=1;
      }
      else if(!okiturn && displayXorO[index] == '')
      {
        displayXorO[index]='X';
        filledboxes+=1;
      }

      okiturn = ! okiturn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //checks 1st Row
    if(
      displayXorO[0] == displayXorO[1] && 
      displayXorO[0] == displayXorO[2] && 
      displayXorO[0] != '') {
      _showWinDialog(displayXorO[0]);
    }
    //checks 2nd Row
    if(
      displayXorO[3] == displayXorO[4] && 
      displayXorO[3] == displayXorO[5] && 
      displayXorO[3] != '') {
      _showWinDialog(displayXorO[3]);
    }
    //checks 3rd Row
    if(
      displayXorO[6] == displayXorO[7] && 
      displayXorO[6] == displayXorO[8] && 
      displayXorO[6] != '') {
      _showWinDialog(displayXorO[6]);
    }
    //checks 1st Column
    if(
      displayXorO[0] == displayXorO[3] && 
      displayXorO[0] == displayXorO[6] && 
      displayXorO[0] != '') {
      _showWinDialog(displayXorO[0]);
    }
    //checks 2nd Row
    if(
      displayXorO[1] == displayXorO[4] && 
      displayXorO[1] == displayXorO[7] && 
      displayXorO[1] != '') {
      _showWinDialog(displayXorO[1]);
    }
    //checks 3rd Column
    if(
      displayXorO[2] == displayXorO[5] && 
      displayXorO[2] == displayXorO[8] && 
      displayXorO[2] != '') {
      _showWinDialog(displayXorO[2]);
    }
    //checks 1st Diagonal
    if(
      displayXorO[0] == displayXorO[4] && 
      displayXorO[0] == displayXorO[8] && 
      displayXorO[0] != '') {
      _showWinDialog(displayXorO[0]);
    }
    //checks 2nd Diagonal
    if(
      displayXorO[2] == displayXorO[4] && 
      displayXorO[2] == displayXorO[6] && 
      displayXorO[2] != '') {
      _showWinDialog(displayXorO[2]);
    }
    else if(filledboxes == 9){
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title:Text("IT'S A DRAW"),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              }, 
              child: Text("Play Again!"),
            )
          ],
        );
      }
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title:Text('WINNER IS : '+ winner),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              }, 
              child: Text("Play Again!"),
            )
          ],
        );
      }
    );
    if(winner=='O'){
      oScore+=1;
    }
    else if(winner=='X'){
      xScore+=1;
    }
  }

  void _clearBoard(){
    setState(() {
      for(int i=0;i<9;i++)
    {
      displayXorO[i]='';
    }
    });
    
    filledboxes = 0;
  }
}
