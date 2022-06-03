import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartProvider.dart';
import 'widgets/Appbar.dart';
import 'widgets/ItemList.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({Key? key}) : super(key: key);

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        child: Consumer<ItemProvider>(
          builder: (context, value, child) {
            return ItemList(value);
          },
        ),
      ),
    );
  }
}
