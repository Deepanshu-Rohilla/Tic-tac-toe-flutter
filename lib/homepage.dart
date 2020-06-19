import 'package:flutter/material.dart';
import 'package:zerokaata/gamebutton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonList = doInit();
  }

  List<GameButton> doInit() {

    player1 = List();
    player2 = List();
    activePlayer=1;

    var gameButtons = <GameButton>[
      GameButton(
        id: 1,
      ),
      GameButton(
        id: 2,
      ),
      GameButton(
        id: 3,
      ),
      GameButton(
        id: 4,
      ),
      GameButton(
        id: 5,
      ),
      GameButton(
        id: 6,
      ),
      GameButton(
        id: 7,
      ),
      GameButton(
        id: 8,
      ),
      GameButton(
        id: 9,
      ),
    ];
    return gameButtons;
  }


  void playGame(GameButton gb){
    setState(() {
      if(activePlayer==1){
        gb.text= 'X';
        gb.bg = Colors.red;
        activePlayer =2;
        player1.add(gb.id);
      }
      else{
        gb.text='0';
        gb.bg = Colors.black;
        activePlayer=1;
        player2.add(gb.id);
      }
      gb.enabled=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Zero Kaata'),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.0, crossAxisSpacing: 9.0, mainAxisSpacing: 9.0),
          itemCount: buttonList.length,
          itemBuilder: (context, i) => SizedBox(
            width: 100,
            height: 100,
            child: RaisedButton(
              padding: const EdgeInsets.all(8.0),
              onPressed: buttonList[i].enabled ? () => playGame(buttonList[i]) : null,
              child: Text(
                buttonList[i].text,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: buttonList[i].bg,
              disabledColor: buttonList[i].bg,
            ),
          ),
        ));
  }
}
