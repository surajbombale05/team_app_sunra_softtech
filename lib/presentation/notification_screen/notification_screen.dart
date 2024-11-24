import 'package:flutter/material.dart';
import 'package:team_app/presentation/notification_screen/detail_notification_screen.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => const DetailNotificationScreen(),));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0 , horizontal: 8),
              child: Container(
                height: 66,
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColors.whiteColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical : 13.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AppImages.messageNotificationIcon, height: 24,width: 24,),
                          )),
                      const SizedBoxWidget(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Question",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                          TextWidget(
                            text: "Lorem Ipsum is simply dummy text of the printing",
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.semiDarkColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
