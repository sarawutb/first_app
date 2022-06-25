// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);

import 'dart:convert';

ListModel listModelFromJson(String str) => ListModel.fromJson(json.decode(str));

class ListModel {
    ListModel({
        this.txnDate,
        this.province,
        this.newCase,
        this.totalCase,
        this.newCaseExcludeabroad,
        this.totalCaseExcludeabroad,
        this.newDeath,
        this.totalDeath,
        this.updateDate,
    });

    DateTime ?txnDate;
    String ?province;
    int ?newCase;
    int ?totalCase;
    int ?newCaseExcludeabroad;
    int ?totalCaseExcludeabroad;
    int ?newDeath;
    int ?totalDeath;
    DateTime ?updateDate;

    factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        txnDate: DateTime.parse(json["txn_date"]),
        province: json["province"],
        newCase: json["new_case"],
        totalCase: json["total_case"],
        newCaseExcludeabroad: json["new_case_excludeabroad"],
        totalCaseExcludeabroad: json["total_case_excludeabroad"],
        newDeath: json["new_death"],
        totalDeath: json["total_death"],
        updateDate: DateTime.parse(json["update_date"]),
    );

  
}
