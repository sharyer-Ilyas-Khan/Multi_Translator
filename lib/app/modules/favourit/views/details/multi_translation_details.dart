import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/color_code.dart';
import '../../../../data/text_style.dart';

class MultiTranslationDetailsView extends GetView {
  final data;
  final List prefixList;
  final List dataList;
  const MultiTranslationDetailsView(
      {Key? key, this.data, required this.prefixList, required this.dataList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Translation Details",
          style: appBar,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              height: Get.height * 0.2,
              width: Get.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Form : ${data["from"]}",
                      style: toTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: Get.height * 0.12,
                        child: SingleChildScrollView(
                            child: Text(
                          data["from_data"],
                          overflow: TextOverflow.fade,
                          style: toTextStyle,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: SizedBox(
              height: Get.height * 0.6,
              width: Get.width * 0.9,
              child: ListView.builder(
                  itemCount: prefixList.length,
                  itemBuilder: (_, index) {
                    print(prefixList);
                    print(prefixList.length);
                    return SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "To : ${prefixList[index]}",
                                style: fromTextStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: Get.height * 0.1,
                                width: Get.width * 0.85,
                                child: SingleChildScrollView(
                                    child: Text(
                                  dataList[index],
                                  overflow: TextOverflow.fade,
                                  style: fromHintStyle,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Divider(
                                thickness: 2,
                                color: Colors.black12,
                              ),
                            ),
                          ]),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
