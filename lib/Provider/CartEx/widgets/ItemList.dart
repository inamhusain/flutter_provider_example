import 'package:flutter/material.dart';

import '../cartProvider.dart';

// ignore: non_constant_identifier_names
ItemList(ItemProvider value) {
  return ListView.builder(
    itemCount: value.itemList.length,
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
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  value.itemList[index].id.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  value.itemList[index].itemName,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "\$${value.itemList[index].itemPrice.toString()}",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              value.itemList[index].itemDesc,
              style:
                  TextStyle(fontSize: 18, color: Colors.grey, letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            MaterialButton(
                onPressed: () {
                  value.addToCart(item: value.itemList[index]);
                  value.cartTotal();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text(
                      value.itemIsOnCart == false
                          ? "Add to Cart Successfull"
                          : "Item Alredy On Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 1.5, fontWeight: FontWeight.bold),
                    ),
                  ));
                },
                elevation: 5,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ))
          ],
        ),
      );
    },
  );
}
