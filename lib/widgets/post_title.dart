import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ListTile(
        title: Text(
          "Jepriana", 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
          ),
          subtitle: Text('Denpasar Bali', style: TextStyle(color: Colors.grey),),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg'),
          )

    ); 
  }
}