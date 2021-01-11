//import 'dart:html';
import 'dart:io';

class BranchElective {
  String courseName;
  String courseCode;
  String branch;
  int year;

  BranchElective(this.courseName, this.courseCode, this.branch, this.year);
}

class OpenElective {
  String courseName;
  String courseCode;

  OpenElective(this.courseName, this.courseCode);
}

void printlist(var list) {
  int size = list.length;
  for (int i = 0; i < size; i++) {
    stdout.write(list[i].courseName);
    stdout.write(" ");
    stdout.write(list[i].courseCode);
    print("");
  }
}

final ecbe1 = BranchElective("Signal Processing", "EC112", "ec", 2);
final ecbe2 = BranchElective("Audio and Video Signals", "EC113", "ec", 3);
final ecbe4 = BranchElective("Something", "EC115", "ec", 4);
final ecbe3 = BranchElective("Essential Course", "EC114", "ec", 4);
final csbe1 = BranchElective("Data Structures and Algorithims", "CS112", "cs", 2);
final csbe2 = BranchElective("Cloud Computing", "CS113", "cs", 3);
final csbe3 = BranchElective("Operaitng Systmes Deep Dive", "CS114", "cs", 4);
final itbe1 = BranchElective("Machine Learning", "IT112", "it", 2);
final itbe2 = BranchElective("Graph Theory", "IT113", "it", 3);
final itbe3 = BranchElective("Network and Systems", "IT114", "it", 4);

final oe1 = OpenElective("Competitive Programming", "CP110");
final oe2 = OpenElective("App Development with Flutter", "FL111");
final oe3 = OpenElective("MERN Full Stack Web Development", "ME110");
final oe4 = OpenElective("Business Manangement Basics", "BM110");

void main() {
  var branchElectives = [
    {0:{}},                         //purposely created to facilitate easy indexing
    {1: {'cs': [],'ec':[], 'it':[]}},
    {2: {'cs': [csbe1],'ec':[ecbe1], 'it':[itbe1]}},
    {3: {'cs': [csbe2],'ec':[ecbe2], 'it':[itbe2]}},
    {4: {'cs': [csbe3],'ec':[ecbe3, ecbe4], 'it':[itbe3]}}
  ];

  List<OpenElective> OEList = [oe1, oe2, oe3, oe4];

  print("Welcome!");
  print("Enter type of user: 1:Admin 2:Student");
  int userType = int.parse(stdin.readLineSync());

  if (userType == 1) //user is an admin
  {
    print("Enter Course Type: 1:Open Elective 2:Branch Elective");
    int courseType = int.parse(stdin.readLineSync());

    if (courseType == 1) //open elective
    {
      print("Enter Course Name:");
      String courseName = stdin.readLineSync();

      print("Enter Course Code:");
      String courseCode = stdin.readLineSync();

      final oe5 = OpenElective(courseName, courseCode);
      OEList.add(oe5);

      print("Added Successfully!");
    } else //branch elective
    {
      print("Enter Course Name:");
      String courseName = stdin.readLineSync();

      print("Enter Course Code:");
      String courseCode = stdin.readLineSync();

      print("Enter Branch: (cs/ec/it)");
      String branch = stdin.readLineSync();

      print("Enter Year:");
      int year = int.parse(stdin.readLineSync());

      final varbe = BranchElective(courseName, courseCode, branch, year);
      branchElectives[year][year][branch].add(varbe);
      print("Added Successfully!");
    }
  } else if (userType == 2) //user is a student
  {
    print("Enter Branch: (cs/ec/it)");
    String branch = stdin.readLineSync();

    print("Enter Year:");
    int year = int.parse(stdin.readLineSync());

    print("<List of Open Electives>");
    printlist(OEList);

    print("");
    print("<List of Branch Electives>");
    printlist(branchElectives[year][year][branch]);

  }
}
