import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.person_fill,
                      color: Colors.black,
                      size: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Text(
                      "User Email",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(

                    children: [
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text("Home"),
                        onTap: (){
                          Navigator.pop(context); // Close the drawer


                        },
                      ),



                      ListTile(
                        leading: Icon(Icons.face),
                        title: Text("Profile"),
                        onTap: (){


                        },
                      ),

                    ],
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red,),
                    title: Text("Log Out", style: TextStyle(color: Colors.red),),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },

                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
