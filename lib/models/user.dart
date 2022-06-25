// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.fullName,
        this.userId,
        this.userGroup,
        this.userGroupName,
        this.token,
        this.branchList,
        this.selctBranch,
        this.wmSWh,
        this.wmSBranch,
    });

    String ? fullName;
    BranchList ? selctBranch;
    String ? userId;
    String ? userGroup;
    String ? userGroupName;
    String ? token;
    List<BranchList> ? branchList;

    String ? wmSWh;
    String ? wmSBranch;

    factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["fullName"],
        userId: json["userId"],
        userGroup: json["userGroup"],
        userGroupName: json["userGroupName"],
        token: json["token"],
        branchList: List<BranchList>.from(json["branchList"].map((x) => BranchList.fromJson(x))),
        wmSWh: json["wmS_WH"],
        wmSBranch: json["wmS_Branch"],
    );

  get branchname => null;

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "userId": userId,
        "userGroup": userGroup,
        "userGroupName": userGroupName,
        "token": token,
        "branchList": List<dynamic>.from(branchList!.map((x) => x.toJson())),
        "wmS_WH": wmSWh,
        "wmS_Branch": wmSBranch,
    };
}

class BranchList {
    BranchList({
        this.branchCode,
        this.branchname,
    });

    String ? branchCode;
    String ? branchname;

    factory BranchList.fromJson(Map<String, dynamic> json) => BranchList(
        branchCode: json["branchCode"],
        branchname: json["branchname"],
    );

    Map<String, dynamic> toJson() => {
        "branchCode": branchCode,
        "branchname": branchname,
    };
}
