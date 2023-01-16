import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';

import '../controllers/languages_controller.dart';

class LanguagesView extends GetView<LanguagesController> {
  final String? type;
  final id;
  LanguagesView({Key? key, this.type, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LanguagesController controller = Get.put(LanguagesController());
    // languages.sort((a, b) => a.compareTo(b));
    print(languages);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'All Languages',
            style: appBar,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                // controller.setIndex(index,type,id);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 0.0, bottom: 0.0),
                child: SizedBox(
                  height: Get.height * 0.06,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.check_rounded,
                            size: 20,
                          ),
                          // color: controller.selectedIndex.value==index?Colors.grey.shade700:Colors.transparent,),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Auto Detect",
                            style: languageTitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.black26,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Recent Language",
                style: languageTitleHeading,
              ),
            ),
            SizedBox(
                height: Get.height * 0.1,
                width: Get.width * 0.96,
                child: Column(
                  children: const [
                    Text("Auto Detect"),
                  ],
                )),
            const Divider(
              color: Colors.black26,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "All language",
                style: languageTitleHeading,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (_, index) {
                return Obx(
                  () => InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      controller.setIndex(index, type, id);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, top: 0.0, bottom: 0.0),
                      child: SizedBox(
                        height: Get.height * 0.06,
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_rounded,
                                  size: 20,
                                  color: controller.selectedIndex.value == index
                                      ? Colors.grey.shade700
                                      : Colors.transparent,
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  languages[index],
                                  style: languageTitle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ));
  }

  List languages = [
    "English",
    "Spanish",
    "German",
    "Arabic",
    "French",
    "Italian",
    "Urdu",
    "Hindi",
    "Dutch",
    "Thai",
    "Russian",
    "Afrikaans",
    "Chinese",
    "Bengali",
    "Czech",
    "Danish",
    "Estonian",
    "Finnish",
    "Georgian",
    "Greek",
    "Gujarati",
    "Hungarian",
    "Icelandic",
    "Telugu",
    "Tamil",
    "Ukrainian",
    "Romanian",
    "Japanese",
    "Korean",
    "Irish",
    "Indonesian",
    "Hebrew",
    "Kannada",
    "Korean",
    "Swedish",
    "Polish",
    "Farsi",
    "Norwegian",
    "Portuguese",
    "Belarusian",
    "Bulgarian",
    "Catalan",
    "Haitian Creole",
    "Latvian",
    "Lithuanian",
    "Macedonian",
    "Malay",
    "Maltese",
    "Slovak",
    "Slovenian",
    "Swahili",
    "Vietnamese",
  ];
}
