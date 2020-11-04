import 'package:flutter/material.dart';

import 'package:flutterapiarchitecture/provider/GetAllEmployeeProvider.dart';

import 'package:flutterapiarchitecture/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetAllEmployeeProvider>(
            create: (context) => GetAllEmployeeProvider()),
      ],
      child: HomeScreen(),
    );
  }
}
