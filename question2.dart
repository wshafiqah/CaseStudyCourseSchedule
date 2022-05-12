import 'dart:io';

class Subject {
  late int id;
  late String courseCode;
  late int sec;
  late DateTime created_at;
  late DateTime updated_at;
  Subject(int id, String courseCode, int sec) {
    this.id = id;
    this.courseCode = courseCode;
    this.sec = sec;
    this.created_at = DateTime.now();
    this.updated_at = DateTime.now();
  }
}
class Schedule {
  late int id;
  late String courseCode;
  late int sec;
  late DateTime created_at;
  late DateTime updated_at;
  List<Subject> items = [];
  Schedule(int id, String courseCode, int sec) {
    this.id = id;
    this.courseCode = courseCode;
    this.sec = sec;
    this.created_at = DateTime.now();
    this.updated_at = DateTime.now();
  }
  void addItem(Subject addedItem) {
    var existed = false;
    this.items.forEach((Subject item) {
      if (item.id == addedItem.id) {
        existed = true;
      }
    });
    if (existed) {
      print('The ${addedItem.courseCode} already exist in ${this.courseCode}');
    } else {
      this.items.add(addedItem);
      print('The ${addedItem.courseCode} was added into ${this.courseCode}');
    }
    if (existed) {
      print('The ${addedItem.sec} already exist in ${this.sec}');
    } else {
      this.items.add(addedItem);
      print('The ${addedItem.sec} was added into ${this.sec}');
    }
  }
}
void main() {
  var currentItemId = 1;
  var currentStorageId = 1;
  List<Subject> subjectList = [];
  List<Schedule> scheduleList = [];
  while (true) {
    print("\n\n");
    print("A Course Scheduling System:");
    print("1. Display the list of subject");
    print("2. Add the subject");
    print("3. Drop the subject");
    print("4. Display the schedule");
    print("5. Exit");
    stdout.write("Enter your choice: ");
    int input = int.parse(stdin.readLineSync()!);
    if (input == 1) {
      displaySubject();
    } else if (input == 2) {
      addSubject(currentItemId, subjectList);
      currentItemId++;
    } else if (input == 3) {
      createStorage(currentStorageId, scheduleList);
      currentStorageId++;
      //addItemToStorage(itemList, storageList);
    } else if (input == 4) {
      displayAllItem(subjectList);
    } else {
      break;
    }
    print('\n\n');
  }
}
void displaySubject() {
 
var orderLines = <Map>[]; // creates an empty List<Map>
orderLines.add({ 'Course Code'  : 'INFO 4501',
              'Subject' : 'IT AND ISLAM',
              'Section' : 1,
              'Day'  : 'M-W',
              'Time' : '1000-1120'
             });
orderLines.add({ 'Course Code'  : 'INFO 4501',
              'Subject' : 'IT AND ISLAM',
              'Section' : 2,
              'Day'  : 'T-TH',
              'Time' : '1400-1520'
             });

orderLines.add({ 'Course Code'  : 'INFO 3102',
              'Subject' : 'DATA WAREHOUSING',
              'Section' : 1,
              'Day'  : 'M-W',
              'Time' : '830-950'
             });
orderLines.add({ 'Course Code'  : 'INFO 3102',
              'Subject' : 'DATA WAREHOUSING',
              'Section' : 2,
              'Day'  : 'T-TH',
              'Time' : '1130-1250'
             });       
orderLines.add({ 'Course Code'  : 'INFO 3102',
              'Subject' : 'DATA WAREHOUSING',
              'Section' : 3,
              'Day'  : 'T-TH',
              'Time' : '1400-1520'
             });


print("\nThe list of Subject");
orderLines.forEach(print);
print('\n');


}
void addSubject(int currentId, List<Subject> items) {
  stdout.write("Enter the course code: ");
  String input = stdin.readLineSync()!;
  var newSubject = Subject(currentId, input);
  items.add(newSubject);
  
  stdout.write("Enter the section: ");
  String section = stdin.readLineSync()!;
  var newSection= Subject(currentId, section);
  items.add(newSection);
}
void createStorage(int currentId, List<Schedule> schedule) {
  stdout.write("Enter the storage name: ");
  String input = stdin.readLineSync()!;
  var newSchedule = Schedule(currentId, input);
  schedule.add(newSchedule);
}

void displayAllItem(List<Subject> items) {
  print('\n\n');
  items.forEach((Subject item) {
    print('id: ${item.id}, courseCode: ${item.courseCode}, sec: ${item.sec}');
  });
}