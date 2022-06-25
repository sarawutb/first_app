// To parse this JSON data, do
//
//     final goods = goodsFromJson(jsonString);

import 'dart:convert';

Goods goodsFromJson(String str) => Goods.fromJson(json.decode(str));

class Goods {
    Goods({
        this.itemcode,
        this.itemname,
        this.itemType,
        this.unitcode,
        this.unitname,
        this.barcode,
        this.unitStandard,
        this.unitStandardName,
        this.isHoldPurchase,
        this.isHoldSale,
        this.gotoItem,
    });

    String ? itemcode;
    String ? itemname;
    int ? itemType;
    String ? unitcode;
    String ? unitname;
    String ? barcode;
    String ? unitStandard;
    String ? unitStandardName;
    int ? isHoldPurchase;
    int ? isHoldSale;
    String ? gotoItem;

    factory Goods.fromJson(Map<String, dynamic> json) => Goods(
        itemcode: json["itemcode"],
        itemname: json["itemname"],
        itemType: json["item_type"],
        unitcode: json["unitcode"],
        unitname: json["unitname"],
        barcode: json["barcode"],
        unitStandard: json["unit_standard"],
        unitStandardName: json["unit_standard_name"],
        isHoldPurchase: json["is_hold_purchase"],
        isHoldSale: json["is_hold_sale"],
        gotoItem: json["goto_item"],
    );


}
