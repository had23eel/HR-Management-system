class Requests {
  List<Results>? results;

  Requests({this.results});

  Requests.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? from;
  String? destination;
  String? reason;
  String? start;
  String? end;
  String? orderStatus;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? typeOfLeaveId;
  String? dateOfLeave;
  String? endingDateOfLeave;
  String? reasonForLeave;
  String? medicalReportPath;
  String? leaveStatus;
  TypeOfLeave? typeOfLeave;

  Results(
      {this.id,
        this.from,
        this.destination,
        this.reason,
        this.start,
        this.end,
        this.orderStatus,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.typeOfLeaveId,
        this.dateOfLeave,
        this.endingDateOfLeave,
        this.reasonForLeave,
        this.medicalReportPath,
        this.leaveStatus,
        this.typeOfLeave});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from']??"leave";
    destination = json['destination'];
    reason = json['reason'];
    start = json['start'];
    end = json['end'];
    orderStatus = json['order_status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeOfLeaveId = json['type_of_leave_id'];
    dateOfLeave = json['date_of_leave'];
    endingDateOfLeave = json['ending_date_of_leave'];
    reasonForLeave = json['reason_for_leave'];
    medicalReportPath = json['medical_report_path'];
    leaveStatus = json['leave_status'];
    typeOfLeave = json['type_of_leave'] != null
        ? new TypeOfLeave.fromJson(json['type_of_leave'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from'] = this.from;
    data['destination'] = this.destination;
    data['reason'] = this.reason;
    data['start'] = this.start;
    data['end'] = this.end;
    data['order_status'] = this.orderStatus;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type_of_leave_id'] = this.typeOfLeaveId;
    data['date_of_leave'] = this.dateOfLeave;
    data['ending_date_of_leave'] = this.endingDateOfLeave;
    data['reason_for_leave'] = this.reasonForLeave;
    data['medical_report_path'] = this.medicalReportPath;
    data['leave_status'] = this.leaveStatus;
    if (this.typeOfLeave != null) {
      data['type_of_leave'] = this.typeOfLeave!.toJson();
    }
    return data;
  }
}
class TypeOfLeave {
  int? id;
  String? leaveName;
  Null? durationOfLeave;
  String? createdAt;
  String? updatedAt;

  TypeOfLeave(
      {this.id,
        this.leaveName,
        this.durationOfLeave,
        this.createdAt,
        this.updatedAt});

  TypeOfLeave.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaveName = json['leave_name'];
    durationOfLeave = json['duration_of_leave'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['leave_name'] = this.leaveName;
    data['duration_of_leave'] = this.durationOfLeave;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}