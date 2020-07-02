import 'package:flutter/material.dart';

class PurchaseCoin extends StatefulWidget {
  @override
  _PurchaseCoinState createState() => _PurchaseCoinState();
}

class _PurchaseCoinState extends State<PurchaseCoin> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Widget viewScreen() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Coins enable you to Boost Posts as well as Contribute to fellow artists Learn more',
            textAlign: TextAlign.center,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              width: 100,
              child: TextField(
                maxLength: 4,
                keyboardType: TextInputType.number,
                controller: _textEditingController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: " ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text("Note: Max Coins 1000"),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width,
            child: FlatButton(
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(_textEditingController.text),
                      );
                    });
              },
              child: Text(
                "Buy",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(title: Text("Buy Coins"), centerTitle: true);
  }

  Widget body(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: viewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }
}
