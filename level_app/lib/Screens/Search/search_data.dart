import 'package:flutter/material.dart';



class ProfileList extends StatelessWidget {
  const ProfileList ({super.key, required this.profiles});

  final List profiles;
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: profiles.length,

      separatorBuilder: (context,index){
        return const  Divider();
      },
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset("${profiles[index]["image"]}", width: 50, height: 50,),
          title: Text("${profiles[index]["name"]}"),
          subtitle: Text('${profiles[index]["type"]}\n${profiles[index]["discipline"]}'),
        );
      },
    );
  }
}