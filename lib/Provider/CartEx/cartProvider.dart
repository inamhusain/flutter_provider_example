import 'package:flutter/widgets.dart';

import 'itemData.dart';

class ItemProvider extends ChangeNotifier {
  bool itemIsOnCart = false;
  double grandTotal = 0;
  List<ItemData> itemList = [
    ItemData(
        1,
        "Item 1",
        100,
        "Est sit nostrud veniam incididunt nisi laboris ea dolor et consequat",
        1),
    ItemData(
        2,
        "Item 2",
        200,
        "Est sit nostrud veniam incididunt nisi laboris ea dolor et consequat",
        1),
    ItemData(
        3,
        "Item 3",
        300,
        "Est sit nostrud veniam incididunt nisi laboris ea dolor et consequat",
        1),
    ItemData(
        4,
        "Item 4",
        400,
        "Est sit nostrud veniam incididunt nisi laboris ea dolor et consequat",
        1),
    ItemData(
        5,
        "Item 5",
        500,
        "Est sit nostrud veniam incididunt nisi laboris ea dolor et consequat",
        1),
  ];
  List<ItemData> cartItemList = [];

  addToCart({required ItemData item}) {
    if (cartItemList.isEmpty) {
      cartItemList.add(item);
    } else {
      int _itemIndex =
          cartItemList.indexWhere((element) => element.id == item.id);
      if (_itemIndex == -1) {
        cartItemList.add(item);
      } else {
        itemIsOnCart = true;
      }
    }
    notifyListeners();
  }

  cartTotal() {
    grandTotal = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      grandTotal = grandTotal + cartItemList[i].itemTotalPrice;
      // print(grandTotal);
    }
    notifyListeners();
  }

  removeItemFromCart(index) {
    cartItemList.removeAt(index);
    cartTotal();
    notifyListeners();
  }

  getTotalPrice() async {
    for (int i = 0; i < cartItemList.length; i++) {
      cartItemList[i].itemTotalPrice =
          itemList[i].itemPrice * cartItemList[i].quantity;
    }
  }

  increseQuantity(index) async {
    cartItemList[index].quantity = cartItemList[index].quantity + 1;
    print(itemList[index].itemPrice);
    await getTotalPrice();
    cartTotal();
    notifyListeners();
  }

  decreseQuantity(index) async {
    if (cartItemList[index].quantity == 1) {
      removeItemFromCart(index);
    } else {
      cartItemList[index].quantity = cartItemList[index].quantity - 1;
      print(itemList[index].itemPrice);
      await getTotalPrice();
    }

    cartTotal();
    notifyListeners();
  }
}
