import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
  
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Профиль"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                children: [
                    CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://i.gifer.com/ZbS5.gif'),
                    ),
                    Text('\n'),
                    
                    ListTile(                    
                        title: 
                            Text(
                                "Эл. почта", 
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 16,
                                    color: Colors.black),                                
                            ),
                        subtitle: 
                            Text(
                                "ars_pro@bk.ru", 
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red),
                            ),
                        onTap: () {},
                    ),
                    const Divider(
                        color: Colors.red,
                        height: 15,
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                    ),

                    ListTile(                    
                        title: 
                            Text(
                                "Ваше имя", 
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 16,
                                    color: Colors.black),
                            ),
                        subtitle: 
                            Text(
                                "Евгений",
                                style: TextStyle(
                                    fontSize: 16, 
                                    color: Colors.red),
                            ),
                        onTap: () {},
                    ),
                    const Divider(
                        color: Colors.red,
                        height: 15,
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                    ),        
                ],
            ),    
        ), 
    );
  }
}
