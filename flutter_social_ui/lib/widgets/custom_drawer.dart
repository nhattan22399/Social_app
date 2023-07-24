import 'package:app_social/data/data.dart';
import 'package:app_social/screens/home_screen.dart';
import 'package:app_social/screens/login_screen.dart';
import 'package:app_social/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  _buildDrawerOption(Icon icon, String title, VoidCallback  onTap){
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl.toString()),
                fit: BoxFit.cover,
              ),
              Positioned(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0, color: Theme.of(context).primaryColor),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl.toString()),
                          fit: BoxFit.cover,
                        ), 
                      ),
                    ),
                    SizedBox(width: 6.0,),
                    Text(
                      currentUser.name.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5
                      ),
                    ),
                  ],
                ),
                bottom: 20.0,
                left: 20.0,)
            ],
          ),
          _buildDrawerOption(Icon(Icons.dashboard), 'Home', 
            () => Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: 
            (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(Icon(Icons.chat), 'Chat', () { }),
          _buildDrawerOption(Icon(Icons.location_on), 'lLocation', () { }),
          _buildDrawerOption(Icon(Icons.account_circle), 'Your Profile', () => Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: 
            (_) => ProfileScreen(user: currentUser,),
              ),
            ),
          ),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', () { }),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child:  _buildDrawerOption(Icon(Icons.directions_run), 'Logout', () => Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: 
                (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          )
         
        ],
      ),
    );
  }
} 