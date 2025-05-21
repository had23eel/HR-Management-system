import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class LeaveModel{


  String? start_date;
  String? end_date;
  String? reason;
  String? medicalreport;
  LeaveModel({
    this.start_date,
    this.end_date,
    this.medicalreport,
    this.reason
});
  LeaveModel.fromJson(Map<String,dynamic> json){
    start_date=json['date_of_leave'];
    end_date=json['ending_date_of_leave'];
    reason=json['reason_for_leave']??"";
    medicalreport=json['medical_report_path']??"";

  }
  Map<String, dynamic> toJson(messagebody) => {
    "date_of_leave": start_date,
    "ending_date_of_leave":end_date,
    "reason_for_leave":reason??"",
    "medical_report_path":medicalreport??""
  };
}