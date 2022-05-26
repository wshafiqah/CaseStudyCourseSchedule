class Subject {
  late int id;
  late String courseCode;

  Subject(int id, String courseCode) {
    this.id = id;
    this.courseCode = courseCode;
    
  }
}
class Schedule {
  late int id;
  late String courseCode;
  List<Subject> items = [];
  Schedule(int id, String courseCode) {
    this.id = id;
    this.courseCode = courseCode;
  
  }
}