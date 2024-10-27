import 'package:flutter/material.dart';
import 'package:hello_world/colors.dart';
import 'package:hello_world/info.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: info.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(info[index]['name'].toString()),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              info[index]['message'].toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          leading: CircleAvatar(
                              backgroundImage:
                                  getPicture(info[index]['profilePic'].toString()).image),
                          trailing: Text(
                            info[index]['time'].toString(),
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const Divider(color: dividerColor, indent:85,),
                  ],
                );
              },
            ),
          );
  }

  Image getPicture(String url) {
    return Image.network(
      url,
      errorBuilder: (context, error, stackTrace) {
        return const Image(
          image: NetworkImage('https://via.placeholder.com/150'),
        );
      },
    );
  }
}
