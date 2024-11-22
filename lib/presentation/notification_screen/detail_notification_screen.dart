import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class DetailNotificationScreen extends StatelessWidget {
  const DetailNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: false,
          excludeHeaderSemantics: false,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Image.asset(AppImages.arrowLeftIcon)),
          centerTitle: true,
          title: const TextWidget(
            text: "Notification",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBoxWidget(
                height: 20,
              ),
              Center(
                child: Container(
                    height: 95,
                    width: 95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.faintSkyColor),
                    child: Image.asset(AppImages.messageNotificationIcon, height:130, width: 140,)),
              ),
              const SizedBoxWidget(
                height: 25,
              ),
              const TextWidget(
                text: "Notification title!",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
               const SizedBoxWidget(
                height: 7,
               ),
              const TextWidget(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.darkColor,
              )
            ],
          ),
        ));
  }
}
