import 'package:ecommerce_app/controller/settings_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:ecommerce_app/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Container(
      child: Container(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(height: Get.width / 3, color: AppColor.primaryColor),
                Positioned(
                  top: Get.width / 4.4,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(AppImageasset.avatar),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text("Disable Notification"),
                      trailing: Switch(
                        value: true,
                        onChanged: (val) {},
                      ), // <====== cameback later
                    ),

                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutse.addressview);
                      },
                      title: Text("Address"),
                      trailing: Icon(Icons.location_on_outlined),
                    ),

                    ListTile(
                      onTap: () {},
                      title: Text("About us"),
                      trailing: Icon(Icons.help_center_outlined),
                    ),

                    ListTile(
                      onTap: () {},
                      title: Text("contact us"),
                      trailing: Icon(Icons.phone_enabled_outlined),
                    ),

                    ListTile(
                      onTap: () {
                        controller.logout();
                      },
                      title: Text("Logout"),
                      trailing: Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
