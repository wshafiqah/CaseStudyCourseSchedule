import 'dart:io';

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
void main() {
  var currentItemId = 1;
  //var currentStorageId = 1;
  List<Subject> subjectList = [];
  //List<Schedule> scheduleList = [];
  while (true) {
    print("\n\n");
    print("A Course Scheduling System:");
    print("1. Display the list of subject");
    print("2. Add the subject");
    print("3. Drop the subject");
    print("4. Display the schedule");
    print("5. Exit\n");
    stdout.write("Enter your choice: ");
    int input = int.parse(stdin.readLineSync()!);
    if (input == 1) {
      displaySubject();
    } else if (input == 2) {
      addSubject(currentItemId, subjectList);
      currentItemId++;
    } else if (input == 3) {
      dropSubject(currentItemId, subjectList);
      currentItemId--;
      
    } else if (input == 4) {
      displayAllItem(subjectList);
    } else {
      break;
    }
    print('\n\n');
  }
}
void displaySubject() {
 
var subjectDetail = <Map>[]; // creates an empty List<Map>
subjectDetail.add({ 'Course Code'  : 'INFO 4501',
              'Subject' : 'IT AND ISLAM',
              'Section' : 1,
              'Day'  : 'M-W',
              'Time' : '1000-1120'
             });
subjectDetail.add({ 'Course Code'  : 'INFO 4501',
              'Subject' : 'IT AND ISLAM',
              'Section' : 2,
              'Day'  : 'T-TH',
              'Time' : '1400-1520'
             });

subjectDetail.add({ 'Course Code'  : 'INFO 3102',
              'Subject' : 'DATA WAREHOUSING',
              'Section' : 1,
              'Day'  : 'M-W',
              'Time' : '830-950'
             });
subjectDetail.add({ 'Course Code'  : 'INFO 3102',
              'Subject' : 'DATA WAREHOUSING',
              'Section' : 2,
              'Day'  : 'T-TH',
              'Time' : '1130-1250'
             });       
subjectDetail.add({ 'Course Code'  : 'INFO 3102',
              'Subject' : 'DATA WAREHOUSING',
              'Section' : 3,
              'Day'  : 'T-TH',
              'Time' : '1400-1520'
             });


print("\nThe list of Subject");
subjectDetail.forEach(print);
print('\n');


}
void addSubject(int currentId, List<Subject> items) {
  stdout.write("Enter the course code: ");
  String input = stdin.readLineSync()!;
  var newSubject = Subject(currentId, input);
  items.add(newSubject);

  print('$input is already added to your schedule');

  
}
void dropSubject(int currentId, List<Subject> items) {
  stdout.write("Enter the course code: ");
  String input = stdin.readLineSync()!;
  var newSubject = Schedule(currentId, input);
  items.remove(newSubject == input);
}

void displayAllItem(List<Subject> items) {
  print('\n\n');
  items.forEach((Subject item) {
    print('id: ${item.id}, courseCode: ${item.courseCode}');
  });
}
