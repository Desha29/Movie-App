import 'package:flutter/material.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(backgroundColor: Colors.amber, radius: 40),
            title: Text(
              "Name",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
              "email@gmail.com",
              style: TextStyle(color: Color.fromARGB(103, 193, 181, 181)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.favorite_border_rounded),
                    title: const Text(
                      "Favourite",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(103, 193, 181, 181)),
                    ),
                  );
                }),
          ),
          const ListTile(
            leading: Icon(
              Icons.logout,
              size: 35,
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(103, 193, 181, 181)),
            ),
          )
        ],
      ),
    );
  }
}
