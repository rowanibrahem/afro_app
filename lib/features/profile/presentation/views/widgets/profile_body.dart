import 'package:afro_app/core/shared_widget/custom_button.dart';
import 'package:afro_app/core/theme/colors.dart';
import 'package:afro_app/features/authuntcation/presentation/views/log_in_view.dart';
import 'package:afro_app/features/home_screen/presentation/views/home_view.dart';
import 'package:afro_app/features/profile/presentation/views/widgets/profile_item.dart';
import 'package:afro_app/features/profile/presentation/views/widgets/profile_list_item.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});
   List<ProfileItem> profileItems(BuildContext context) => [
        ProfileItem(
          text: 'Saved Items',
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeView(),
                ),
                );
          },
        ),
        ProfileItem(
          text: 'My Cources',
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeView(),
                ),
                );
          },
        ),
        ProfileItem(
          text: 'About Us',
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeView(),
                ),
                );
          },
        ),
        ProfileItem(
          text: 'Help Center',
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeView(),
                ),
                );
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final double curveHeight = screenHeight / 10; // Set curve height to approximately a quarter of the screen height

    final double screenWidth = MediaQuery.of(context).size.width;

    final double leftPosition = screenWidth >= 600 ? 50 : 20;

    final double topPosition = screenWidth >= 600 ? 100 : 130;

    return SingleChildScrollView(
      child: Stack(
        children: [
          CustomPaint(
            painter: ShapesPainter(curveHeight),
            child: ClipPath(
              clipper:
                  ShapeClipper(curveHeight), // Use the custom clipper to clip the image
              child: Container(
                height: curveHeight + 100, // Adjust container height to accommodate the curve
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
            top: topPosition,
            left: leftPosition,
            // ignore: prefer_const_constructors
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // Image.asset(AssetImages.profile, width: 100, height: 100),
                // SizedBox(height: 20),
                // Text('Rowan Ibrahim', style: Styles.textStyle36),
                
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: curveHeight + 150), // Adjust the height to accommodate the curve
              ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profileItems(context).length,
              itemBuilder: (context, index) {
                final ProfileItem item = profileItems(context)[index];
                return ProfileListItem(
                  text: item.text,
                  icon: item.icon,
                  onPressed: () {
                    item.onTap();
                    print('Item pressed: ${item.text}');
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.grey,
              ),
            ),
            CustomButton(
              text: 'Log out', 
              func: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
              }
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {

  ShapesPainter(this.curveHeight);
  final double curveHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - curveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * curveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(
        p,
        Paint()
          ..color = ColorApp.primaryColor
              .withOpacity(0.6)); // Use opacity to make it transparent
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ShapeClipper extends CustomClipper<Path> {
  final double curveHeight;

  ShapeClipper(this.curveHeight);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.relativeQuadraticBezierTo(
        size.width / 2, 2 * curveHeight, size.width, 0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
