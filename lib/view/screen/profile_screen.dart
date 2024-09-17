import 'package:flutter/material.dart';

import 'package:movie_app/view/widget/home/profile_list_item.dart';

import '../../components/components.dart';
import '../../components/constant/colors.dart';
import '../../cubit/login_cubit/login_cubit.dart';
import 'auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 73, 73, 73),
            radius: 50,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.grey,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
          Text(
            LoginCubit.userName,
            style: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            LoginCubit.userEmail,
            maxLines: 2,
            style: const TextStyle(color: Colors.white70, fontSize: 20),
          ),
          const SizedBox(height: 20),
          ProfileListItem(
            iconData: Icons.logout_outlined,
            title: 'LogOut',
            onTap: () {
              LoginCubit.get(context).logOut();
              navigateToReplacement(context, const LoginScreen());
            },
          )
        ],
      ),
    );
  }
}
