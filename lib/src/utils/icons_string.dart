

import 'package:flutter/material.dart';

Icon getIcon(String iconName) 
  => Icon(_icons[iconName],color: Colors.green,);

final _icons = <String,IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'sliders': Icons.tune,
  'baselist': Icons.list_alt,
  'listas': Icons.list,
};