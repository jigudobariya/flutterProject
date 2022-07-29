import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  //Catalog Field
  late CatalogModel _catalog;

//Collection of Ids -  store Ids Of Each Item
  final List<int> _itemIds = [];

//Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

  //Get Items In The Cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

  //Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.remove(item.id);
  }
}
