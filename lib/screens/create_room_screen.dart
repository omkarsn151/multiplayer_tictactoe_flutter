import 'package:flutter/material.dart';
import '../resources/socket_methods.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe',
        style: TextStyle(
            color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          shadows: [Shadow(color: Colors.black12,blurRadius: 10, offset: Offset(2, 3))]
        ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white,size: 25),
        backgroundColor: const Color(0xFF0D47A1),

        
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                  Color(0xFF64B5F6),
                  Color(0xFF1976D2),
                  Color(0xFF0D47A1),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const CustomText(
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black54,
                      offset: Offset(2, 2),
                    ),
                  ],
                  text: 'Create Room',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),

                const SizedBox(height: 20,),

                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.house_rounded,
                    size: 100,
                    color: Colors.white,
                  ),
                ),


                const SizedBox(height: 20,),

                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter your nickname',
                  textColor: Colors.white,
                  fillColor: Colors.white.withOpacity(0.3),
                ),

                const SizedBox(height: 20,),


                CustomButton(
                  onTap: () => _socketMethods.createRoom(
                    _nameController.text,
                  ),
                  text: 'Create',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
