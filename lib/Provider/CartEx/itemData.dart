class ItemData {
  int _id;
  String _itemName;
  double _itemPrice;
  String _itemDesc;
  int _quantity;
  double itemTotalPrice;
  ItemData(
      this._id, this._itemName, this._itemPrice, this._itemDesc, this._quantity,
      {this.itemTotalPrice = 0});
//setters
  set id(int id) {
    this._id = id;
  }

  set itemName(String itemName) {
    this._itemName = itemName;
  }

  set itemPrice(double itemPrice) {
    this._itemPrice = itemPrice;
  }

  set itemDesc(String itemDesc) {
    this._itemDesc = itemDesc;
  }

  set quantity(int quantity) {
    this._quantity = quantity;
  }

//gatters
  int get id => this._id;
  String get itemName => this._itemName;
  double get itemPrice => this._itemPrice;
  String get itemDesc => this._itemDesc;
  int get quantity => this._quantity;
}
