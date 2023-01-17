class CommonModel {
  final String? classTime;
  final String? course;
  final String? sirName;
  final List<StudentList>? studentList;

  CommonModel({
    this.classTime = "",
    this.course = "",
    this.sirName = "",
    this.studentList,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      classTime: json['class_time'],
      course: json['course'],
      sirName: json['sir_name'],
      studentList: List<StudentList>.from(json["student_list"].map((value) => StudentList.fromJson(value))),
    );
  }
}

class StudentList {
  final String? name;
  final String? fatherName;
  final String? surName;
  final int? age;

  StudentList({
    this.name,
    this.fatherName,
    this.surName,
    this.age,
  });

  factory StudentList.fromJson(Map<String, dynamic> json) {
    return StudentList(
      name: json['name'],
      fatherName: json['father_name'],
      surName: json['surname'],
      age: json['age'],
    );
  }
}
