import 'package:flutter/material.dart';
import 'package:multiplayer_tictactoe/provider/room_data_provider.dart';
import 'package:multiplayer_tictactoe/screens/create_room_screen.dart';
import 'package:multiplayer_tictactoe/screens/game_screen.dart';
import 'package:multiplayer_tictactoe/screens/join_room_screen.dart';
import 'package:multiplayer_tictactoe/screens/main_menu_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'TicTacToe-Multiplayer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // fontFamily: 'courier',
          fontFamily: 'Monaco',
        ),

        routes: {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
        },
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
