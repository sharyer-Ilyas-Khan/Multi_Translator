import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/feedback/controllers/feedback_controller.dart';

class RateUs extends StatelessWidget {
  const RateUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FeedbackController feedbackController = Get.put(FeedbackController());
    return SizedBox(
      height: Get.height * 0.37,
      width: Get.width,
      child: Stack(
        children: [
          Positioned(
              right: 10,
              child: SvgPicture.asset(
                "Assets/svg/top_stars.svg",
                color: Colors.pink.shade300,
              )),
          Positioned(
              bottom: 2,
              left: 10,
              child: SvgPicture.asset(
                "Assets/svg/down_stars.svg",
                color: Colors.pink.shade600,
              )),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              bottom: 15,
              right: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: Image(
                  image: AssetImage("Assets/images/rateus_stars.png"),
                  height: Get.height * 0.15,
                )),
                const Text(
                  "Like using all language translator?",
                  style: rateUsHeading,
                ),
                const Text(
                  "Give us a quick rating so we know if you like it?",
                  style: rateUsDetailsStyle,
                  textAlign: TextAlign.start,
                ),
                Center(
                  child: RatingBar(
                    initialRating: 0,
                    glowColor: Colors.amber,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: SvgPicture.asset(
                        "Assets/svg/one_star_filled.svg",
                        height: 40,
                        width: 20,
                      ),
                      half: SvgPicture.asset(
                        "Assets/svg/one_star_filled.svg",
                        height: 40,
                        width: 20,
                      ),
                      empty: Image(
                        image:
                            AssetImage("Assets/images/one_star_unfilled.png"),
                      ),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                    onRatingUpdate: (rating) {
                      feedbackController.rating.value = rating;
                    },
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
        ],
      ),
    );
  }
}
