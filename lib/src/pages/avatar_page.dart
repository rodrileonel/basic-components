

import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title:Text('AvatarPage'),
      actions: [
        Container(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E03AQHQplUFJ6Z07A/profile-displayphoto-shrink_200_200/0?e=1605139200&v=beta&t=qpjaNdLbLkNHtZ3T24gAcR5YFGntHi0Lliq5L37ArmQ'),)
        ),
        Container(
          padding: EdgeInsets.only(right:8),
          child: CircleAvatar(child: Text('RV'),backgroundColor: Colors.green,)
        )
      ],
    ),
    body: Center(
      child: FadeInImage(
        image: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E03AQHQplUFJ6Z07A/profile-displayphoto-shrink_200_200/0?e=1605139200&v=beta&t=qpjaNdLbLkNHtZ3T24gAcR5YFGntHi0Lliq5L37ArmQ'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds:200),
      )
    ),
  );
    
  
}