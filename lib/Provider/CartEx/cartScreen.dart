import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartProvider.dart';
import 'widgets/BottomBar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ItemProvider>(context, listen: false).getTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Consumer<ItemProvider>(
          builder: (context, value, child) {
            return value.cartItemList.isEmpty
                ? Center(
                    child: Text("No Item In Cart"),
                  )
                : ListView.builder(
                    itemCount: value.cartItemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(4, 4),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.2)),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  value.cartItemList[index].id.toString(),
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  value.cartItemList[index].itemName,
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "\$${value.cartItemList[index].itemTotalPrice.toString()}",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Divider(
                              height: 20,
                              thickness: 3,
                              endIndent: 20,
                              indent: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Spacer(
                                  flex: 2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Provider.of<ItemProvider>(context,
                                              listen: false)
                                          .increseQuantity(index);
                                    },
                                    icon: Icon(Icons.add),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Consumer<ItemProvider>(
                                  builder: (context, value, child) {
                                    return Text(
                                      value.cartItemList[index].quantity
                                          .toString(),
                                      style: TextStyle(fontSize: 20),
                                    );
                                  },
                                ),
                                SizedBox(width: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      value.decreseQuantity(index);
                                    },
                                    icon: Icon(Icons.remove),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    value.removeItemFromCart(index);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      duration: Duration(milliseconds: 500),
                                      content: Text(
                                        "Item Detele",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ));
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                                SizedBox(width: 20),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
      bottomNavigationBar: BottonBar(context),
    );
  }
}
