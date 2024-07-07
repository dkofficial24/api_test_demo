class StudentModel {
  String name;
  int rollNo;
  int age;
  double percentage;

  StudentModel(
    this.name,
    this.rollNo,
    this.age,
    this.percentage,
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> json = {
      'name': name,
      'roll': rollNo,
      'age': age,
      'percentage': percentage
    };
    return json;
  }

  static StudentModel fromMap(Map<String, dynamic> map){
    return StudentModel(
        map['name'],
        map['roll'],
        map['age'],
        map['percentage']
    );
  }
}
