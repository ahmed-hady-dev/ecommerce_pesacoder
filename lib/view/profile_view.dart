import 'package:ecommerce_pesacoder/core/view_model/profile_view_model.dart';
import 'package:ecommerce_pesacoder/view/auth/login_view.dart';
import 'package:ecommerce_pesacoder/view/profile_list_tile.dart';
import 'package:ecommerce_pesacoder/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {
        return controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 100.0,
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100.0),
                              image: DecorationImage(
                                image: controller.userModel == null
                                    ? const AssetImage('assets/images/Avatar.png')
                                    : controller.userModel!.pic == ''
                                        ? const AssetImage('assets/images/Avatar.png')
                                        : NetworkImage(controller.userModel!.pic.toString()) as ImageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                text: controller.userModel!.name!,
                                color: Colors.black,
                                fontSize: 32.0,
                              ),
                              CustomText(
                                text: controller.userModel!.email!,
                                color: Colors.black,
                                fontSize: 24.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      ProfileListTile(
                        text: 'Edit Profile',
                        iconData: Icons.navigate_next,
                        imagePath: 'assets/images/Icon_Edit-Profile.png',
                        onPressed: () {},
                      ),
                      ProfileListTile(
                        text: 'Shipping address',
                        iconData: Icons.navigate_next,
                        imagePath: 'assets/images/Icon_Location.png',
                        onPressed: () {},
                      ),
                      ProfileListTile(
                        text: 'Order History',
                        iconData: Icons.navigate_next,
                        imagePath: 'assets/images/Icon_History.png',
                        onPressed: () {},
                      ),
                      ProfileListTile(
                        text: 'Cards',
                        iconData: Icons.navigate_next,
                        imagePath: 'assets/images/Icon_Payment.png',
                        onPressed: () {},
                      ),
                      ProfileListTile(
                        text: 'Notifications',
                        iconData: Icons.navigate_next,
                        imagePath: 'assets/images/Icon_Alert.png',
                        onPressed: () {},
                      ),
                      ProfileListTile(
                        text: 'Log Out',
                        iconData: Icons.navigate_next,
                        imagePath: 'assets/images/Icon_Exit.png',
                        onPressed: () async {
                          await controller.signOut();
                          Get.offAll(LoginView());
                        },
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
