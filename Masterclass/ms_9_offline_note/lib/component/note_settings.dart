import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteSettings({super.key,required this.onEditPressed,required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
            onEditPressed!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(child: Text("Edit",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),)),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
            onDeletePressed!();
          },
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Center(child: Text("Delete",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontWeight: FontWeight.bold))),
          ),
        ),
      ],
    );
  }
}