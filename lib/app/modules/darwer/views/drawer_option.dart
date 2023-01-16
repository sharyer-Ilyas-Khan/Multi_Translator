import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/in_app_purchase_ui/bindings/in_app_purchase_ui_binding.dart';
import 'package:translator/app/modules/in_app_purchase_ui/views/in_app_purchase_ui_view.dart';

import '../controllers/darwer_controller.dart';

class DrawerOption extends StatelessWidget {
  final String? icon;
  final String? text;
  final int? index;
  final color;
  const DrawerOption({Key? key, this.icon, this.text, this.index, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DarwerController controller = Get.put(DarwerController());
    return InkWell(
      onTap: () {
        if (index == 1) {
          Get.to(() => InAppPurchaseUiView(),
              binding: InAppPurchaseUiBinding());
          // controller.removeAd();
        }
        if (index == 2) {
          controller.favourite();
        }
        if (index == 3) {
          controller.history();
        }
        if (index == 4) {
          controller.feedback();
        }
        if (index == 5) {
          controller.rateUs();
        }
        if (index == 6) {
          controller.share();
        }
        if (index == 7) {
          controller.privacy();
        }
        if (index == 8) {
          controller.exit();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 20.0, top: 10.0),
        child: Container(
          height: Get.height * 0.07,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: color),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "Assets/svg/$icon.svg",
                        height: 20,
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(width: 30),
                Text(
                  text!,
                  style: drawerOptions,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 15,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
