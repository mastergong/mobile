import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:psucoop_mobile/core/themes/app_color.dart';
import 'package:psucoop_mobile/core/themes/app_text.dart';
import 'package:psucoop_mobile/data/helpers/context_ext.dart';
import 'package:psucoop_mobile/presentation/common_widgets/sizebox_widgets.dart';
import 'package:psucoop_mobile/presentation/common_widgets/template_screen.dart';
import 'package:psucoop_mobile/presentation/routes/app_router.dart';

import '../../../../core/themes/app_images.dart';
import '../../../routes/routes.dart';
import '../event/widget_event.dart';
import 'widget/intro_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  List<Slide> initslides({required BuildContext context}) {
    slides.add(
      Slide(
        pathImage: AppImages.introPage1,
        title: "ธุรกรรมออนไลน์",
        textAlignTitle: TextAlign.center,
        styleTitle: AppTextStyle.instance.titleLarge,
        description:
            "เปิดให้บริการการทำธุรกรรมระหว่างบัญชีสหกรณ์ของตน และบัญชีสหกรณ์ของตนเองกับบัญชีธนาคารของตนเอง",
        styleDescription: AppTextStyle.instance.titleMedium,
        widthImage: double.infinity,
        heightImage: context.screenHeight / 3,
        backgroundColor: AppColor.backgroundGray,
      ),
    );
    slides.add(
      Slide(
        pathImage: AppImages.introPage2,
        title: "สอบถามข้อมูล",
        textAlignTitle: TextAlign.center,
        styleTitle: AppTextStyle.instance.titleLarge,
        description: "แสดงข้อมูลทางการเงิน เช่น บัญชีเงินฝากหรือสัญญาเงินกู้",
        styleDescription: AppTextStyle.instance.titleMedium,
        widthImage: double.infinity,
        heightImage: 200,
        backgroundColor: AppColor.backgroundGray,
      ),
    );
    slides.add(
      Slide(
          pathImage: AppImages.introPage3,
          title: "ลงทะเบียน",
          textAlignTitle: TextAlign.center,
          styleTitle: AppTextStyle.instance.titleLarge,
          widthImage: double.infinity,
          heightImage: context.screenHeight / 3,
          backgroundColor: AppColor.backgroundGray,
          widgetDescription: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ลงทะเบียนเปิดใช้งานได้ที่ สำนักงานสหกรณ์ออมทรัพย์ ทุกสาขา",
                  style: AppTextStyle.instance.titleMedium,
                  textAlign: TextAlign.center,
                ),
                sizeboxHeight10(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    elevation: 5,
                  ),
                  onPressed: () {
                    onDonePress();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primaryColor,
                          AppColor.primaryColor,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 30.0),
                      alignment: Alignment.center,
                      width: context.screenWidth / 4,
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: AppTextStyle.instance.titleDarkMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );

    return slides;
  }

  Future<bool> onTrue() async {
    SystemNavigator.pop();
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initslides(context: context);
    return TemplateScreen(
        onWillPop: () => onTrue(),
        child: IntroSlider(
          slides: slides,
          //  renderSkipBtn: renderSkipBtn(),
          //  renderNextBtn: renderNextBtn(),
          showSkipBtn: false,
          showNextBtn: false,
          showPrevBtn: false,
          showDoneBtn: false,
          autoScroll: true,
          pauseAutoPlayOnTouch: true,
          //renderDoneBtn: renderDoneBtn(),
          // onDonePress: onDonePress,
        ));
  }
}
