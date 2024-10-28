// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? status;
  String? token;
  CustomerDetails? customerDetails;
  String? message;

  User({
    this.status,
    this.token,
    this.customerDetails,
    this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    status: json["status"],
    token: json["token"],
    customerDetails: CustomerDetails.fromJson(json["Customer Details"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "Customer Details": customerDetails!.toJson(),
    "message": message,
  };
}

class CustomerDetails {
  int? id;
  String? username;
  String? slug;
  String? referalId;
  String? currentReferalId;
  String? email;
  String? password;
  String? phone;
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  int? fkCountryId;
  int? fkRegionId;
  String? zipCode;
  String? membershipTypeId;
  String? status;
  int? currentRoleId;
  String? resetKey;
  String? referedBy;
  String? isPaid;
  String? isSponser;
  String? loginStatus;
  String? registerStatus;
  String? claimStatus;
  String? profileStatus;
  String? bitConfirm;
  String? defaultBroker;
  String? brokerEarningStatus;
  String? agentEarningStatus;
  String? charity;
  int? achConnect;
  String? internationalMk;
  int? isVerifyEmail;
  int? stateDirectorId;
  dynamic haveSponsor;
  String? corporateInfoHide;
  String? uplineMp;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? serviceProvider;
  dynamic newroleReg;
  int? excelImport;
  String? apiToken;

  CustomerDetails({
    this.id,
    this.username,
    this.slug,
    this.referalId,
    this.currentReferalId,
    this.email,
    this.password,
    this.phone,
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.fkCountryId,
    this.fkRegionId,
    this.zipCode,
    this.membershipTypeId,
    this.status,
    this.currentRoleId,
    this.resetKey,
    this.referedBy,
    this.isPaid,
    this.isSponser,
    this.loginStatus,
    this.registerStatus,
    this.claimStatus,
    this.profileStatus,
    this.bitConfirm,
    this.defaultBroker,
    this.brokerEarningStatus,
    this.agentEarningStatus,
    this.charity,
    this.achConnect,
    this.internationalMk,
    this.isVerifyEmail,
    this.stateDirectorId,
    this.haveSponsor,
    this.corporateInfoHide,
    this.uplineMp,
    this.createdAt,
    this.updatedAt,
    this.serviceProvider,
    this.newroleReg,
    this.excelImport,
    this.apiToken,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) => CustomerDetails(
    id: json["id"],
    username: json["username"],
    slug: json["slug"],
    referalId: json["referal_id"],
    currentReferalId: json["current_referal_id"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    address: json["address"],
    city: json["city"],
    fkCountryId: json["fk_country_id"],
    fkRegionId: json["fk_region_id"],
    zipCode: json["zip_code"],
    membershipTypeId: json["membership_type_id"],
    status: json["status"],
    currentRoleId: json["current_role_id"],
    resetKey: json["reset_key"],
    referedBy: json["refered_by"],
    isPaid: json["is_paid"],
    isSponser: json["is_sponser"],
    loginStatus: json["login_status"],
    registerStatus: json["register_status"],
    claimStatus: json["claim_status"],
    profileStatus: json["profile_status"],
    bitConfirm: json["bit_confirm"],
    defaultBroker: json["default_broker"],
    brokerEarningStatus: json["broker_earning_status"],
    agentEarningStatus: json["agent_earning_status"],
    charity: json["charity"],
    achConnect: json["ach_connect"],
    internationalMk: json["international_mk"],
    isVerifyEmail: json["is_verify_email"],
    stateDirectorId: json["state_director_id"],
    haveSponsor: json["have_sponsor"],
    corporateInfoHide: json["corporate_info_hide"],
    uplineMp: json["upline_mp"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    serviceProvider: json["service_provider"],
    newroleReg: json["newrole_reg"],
    excelImport: json["excel_import"],
    apiToken: json["api_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "slug": slug,
    "referal_id": referalId,
    "current_referal_id": currentReferalId,
    "email": email,
    "password": password,
    "phone": phone,
    "first_name": firstName,
    "last_name": lastName,
    "address": address,
    "city": city,
    "fk_country_id": fkCountryId,
    "fk_region_id": fkRegionId,
    "zip_code": zipCode,
    "membership_type_id": membershipTypeId,
    "status": status,
    "current_role_id": currentRoleId,
    "reset_key": resetKey,
    "refered_by": referedBy,
    "is_paid": isPaid,
    "is_sponser": isSponser,
    "login_status": loginStatus,
    "register_status": registerStatus,
    "claim_status": claimStatus,
    "profile_status": profileStatus,
    "bit_confirm": bitConfirm,
    "default_broker": defaultBroker,
    "broker_earning_status": brokerEarningStatus,
    "agent_earning_status": agentEarningStatus,
    "charity": charity,
    "ach_connect": achConnect,
    "international_mk": internationalMk,
    "is_verify_email": isVerifyEmail,
    "state_director_id": stateDirectorId,
    "have_sponsor": haveSponsor,
    "corporate_info_hide": corporateInfoHide,
    "upline_mp": uplineMp,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "service_provider": serviceProvider,
    "newrole_reg": newroleReg,
    "excel_import": excelImport,
    "api_token": apiToken,
  };
}
