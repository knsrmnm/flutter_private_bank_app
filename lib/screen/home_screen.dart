import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

/// Home screen
class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          padding: EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _makeCardSliderEl(),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _makeMenuCardEl("Statistics", Iconsax.graph4),
                  _makeMenuCardEl("Top Up", Iconsax.add),
                  _makeMenuCardEl("Pay", Iconsax.arrow_right_1),
                  _makeMenuCardEl("More", Iconsax.more),
                ],
              ),
              const SizedBox(height: 40.0),
              Text(
                'Transactions',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationThickness: 10.0,
                    decorationColor: Colors.teal.withOpacity(0.2)
                ),
              ),
              const SizedBox(height: 30.0),
              Column(
                children: [
                  _makeTransactionRowEl("Netflix", "Entertainment", "netflix.png", -13.99),
                  const SizedBox(height: 20.0),
                  _makeTransactionRowEl("Nike", "Shopping", "nike.png", -210.00),
                  const SizedBox(height: 20.0),
                  _makeTransactionRowEl("Amazon", "Shopping", "amazon.png", -89.99),
                  const SizedBox(height: 20.0),
                  _makeTransactionRowEl("Jason Brown", "Person", "user1.png", 34.00),
                  const SizedBox(height: 20.0),
                  _makeTransactionRowEl("Starbucks", "Coffee Shop", "starbucks.png", -35.99),
                  const SizedBox(height: 20.0),
                  _makeTransactionRowEl("Bill Nielsen", "Person", "user2.png", 15.00),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* ----- Widgets ------ */

/// Make card slider widget.
Widget _makeCardSliderEl() {
  List<Widget> contents = [];
  contents.add(_makeCardEl("Standard Mastercard", "\$25,310.00", 4567, "07/23", "mastercard.png"));
  contents.add(const SizedBox(width: 30.0));
  contents.add(_makeCardEl("Platinum", "\$4,585.00", 1289, "12/25", "visa.png"));
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: contents),
  );
}

/// Make card widget.
Widget _makeCardEl(String cardName, String balance, int cardNumber, String date, String image) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
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
                      Text(balance, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
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
    ),
  );
}

/// Make menu card widget.
Widget _makeMenuCardEl(String title, IconData icon) {
  return Card(
    color: Colors.black87,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Container(
      width: 65.0,
      height: 65.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 8.0),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 9.0)),
          ],
        ),
      ),
    ),
  );
}

/// Make a transaction row widget.
Widget _makeTransactionRowEl(String title, String category, String image, double transaction) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Image.asset("assets/icons/"+image, width: 30.0),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0)),
              Text(category, style: TextStyle(color: Colors.black38, fontSize: 10.0)),
            ],
          ),
        ],
      ),
      Text(
        "\$ "+transaction.toString(),
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: (transaction < 0) ? Colors.redAccent : Colors.black87
        ),
      ),
    ],
  );
}