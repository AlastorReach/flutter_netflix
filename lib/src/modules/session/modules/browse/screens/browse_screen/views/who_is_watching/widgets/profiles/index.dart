import 'package:flutter/material.dart';

const List<Map<String, dynamic>> profileMockedData = [
  {"id": 1, "name": "Josué", "perfil_icon_id": "1"},
  {"id": 1, "name": "MYOS", "perfil_icon_id": "2"},
  {"id": 1, "name": "Victoria", "perfil_icon_id": "3", "kids": true}
];

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      ...profileMockedData.map((
        profile,
      ) {
        return NetflixProfileButton(
          name: profile['name'],
          image: Image.asset(
              'assets/images/profile_icons/classic_profile_icon_${profile['perfil_icon_id']}.png'), // Replace with your image path
        );
      }),
      if (profileMockedData.length < 4)
        const NetflixProfileButton(
          name: 'Agregar perfil',
          image: Icon(
            Icons.add_circle_rounded,
            size: 100,
          ),
        )
    ]);
  }
}

class NetflixProfileButton extends StatelessWidget {
  final String name;
  final Widget image;
  final double size;
  final double borderRadius;

  const NetflixProfileButton({
    super.key,
    required this.name,
    required this.image,
    this.borderRadius = 8.0,
    this.size = 200.0, // Adjust size as needed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          // Handle button press
          print('Button pressed: $name');
        },
        child: Column(
          children: [
            Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.red, // Adjust border color
                    width: 2.0, // Adjust border width
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red, // Adjust border color
                          width: 2.0, // Adjust border width
                        ),
                      ),
                      child: image),
                )),
            Text(name)
          ],
        ),
      ),
    );
  }
}
