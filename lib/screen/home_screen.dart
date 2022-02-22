import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

/// Home screen
class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Icon(Iconsax.menu_1, color: Colors.black45),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                Icon(Iconsax.message, color: Colors.black45),
                const SizedBox(width: 15.0),
                Image.asset("assets/icons/man.png", width: 30.0),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: Column(
            children: [
              _makeCardSliderEl(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Make card slider widget.
Widget _makeCardSliderEl() {
  List<Widget> contents = [];
  contents.add(_makeCardEl("Standard Mastercard", "2,3510", 4567, "07/23", "mastercard.png"));
  contents.add(const SizedBox(width: 30.0));
  contents.add(_makeCardEl("Platinum", "4,585", 1289, "12/25", "visa.png"));
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: contents),
  );
}

/// Make card widget.
Widget _makeCardEl(String cardName, String balance, int cardNumber, String date, String image) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: Colors.white,
    ),
    width: 250,
    height: 200,
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset("assets/icons/"+image, width: 30.0),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(balance, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 5.0),
                      Text("USD", style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Text(cardName, style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w300, color: Colors.black38)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "**** **** " + cardNumber.toString(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(date, style: TextStyle(color: Colors.black45, fontSize: 12.0, fontWeight: FontWeight.w400)),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 7.0),
              child: Icon(Iconsax.card, color: Colors.black45, size: 15.0),
            ),
          ),
        ],
      ),
    )
  );
}
