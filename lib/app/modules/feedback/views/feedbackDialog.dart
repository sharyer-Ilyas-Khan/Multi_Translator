import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/feedback/controllers/feedback_controller.dart';

class FeedbackDialog extends StatelessWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FeedbackController feedbackController = Get.put(FeedbackController());

    return SizedBox(
      height: Get.height * 0.4,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          bottom: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: SvgPicture.asset("Assets/svg/feedback_ic.svg")),
            const Text(
              "Your opinion matters to us!",
              style: rateUsHeading,
            ),
            Container(
              height: Get.height * 0.12,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextField(
                  minLines: 1,
                  maxLines: 5,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    // review=value;
                  },
                  focusNode: feedbackController.myFocusNode,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Please write your comment here....",
                      hintStyle: fromHintStyle),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Get.close(1);
                    },
                    child: Text(
                      "Cancel",
                      style: fromTextStyle,
                    )),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      feedbackController.submit();
                    },
                    child: Text("Submit", style: fromTextStyle)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
