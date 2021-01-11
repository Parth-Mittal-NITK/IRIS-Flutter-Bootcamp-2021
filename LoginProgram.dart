import 'dart:io';

class user
{
  String username;
  String pwd;

  user(this.username, this.pwd);
} 

final user1 = user("user1", "User1@123");
final user2 = user("user2", "User2@123");
final user3 = user("user3", "User3@123");
final user4 = user("user4", "User4@123");
void main()
{

  List<user> usersList = [user1,user2, user3, user4];
  int size = usersList.length;
  
  print("Please enter the username: ");
  String name = stdin.readLineSync();

  for (int i=0;i<size;i++)
  {
    if (name == usersList[i].username)
    {
       print("Please enter the password: ");
       String pwd = stdin.readLineSync();

       print("Checking...");
       sleep(Duration(seconds: 3)); //simulating a login check delay

       if (pwd == usersList[i].pwd)
       {
         print("Successfully logged in!");
         return;
       }
       else 
       {
         print("Authentication failed");
         return;
       }
    } 

  }
  print("User not found!");

}