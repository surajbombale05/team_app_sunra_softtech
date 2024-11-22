import 'package:flutter/material.dart';
import 'package:team_app/presentation/notification_screen/notification_screen.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/button_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> profileImages = [
    AppImages.splashIcon,
    AppImages.zigzagIconBg
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Action Button Pressed");
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
          excludeHeaderSemantics: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Welcome back",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primarySkyColor,
                  ),
                  TextWidget(
                    text: "Nitish!",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkTextColor,
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),));
              },
              child: Image.asset(
                AppImages.notificationsIcon,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            children: [
              _progressOverViewWidget(),
              const SizedBoxWidget(
                height: 15,
              ),
              _dataViewWidget(),
              const SizedBoxWidget(
                height: 20,
              ),
              _taskListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _dataViewWidget() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 163,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: "245",
                  color: AppColors.blackColor,
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                ),
                TextWidget(
                  text: "Registered users",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ),
        ),
        const SizedBoxWidget(
          width: 25,
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 163,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: "Go to",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGreyColor,
                    ),
                    const SizedBoxWidget(
                      width: 5,
                    ),
                    Image.asset(AppImages.rightArrowImg)
                  ],
                ),
                const TextWidget(
                  text: "Dashboard",
                  color: AppColors.activeColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _taskListWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: "Todays Task",
              color: AppColors.activeColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            const SizedBoxWidget(
              width: 5,
            ),
            Container(
              height: 16,
              width: 22,
              decoration: BoxDecoration(
                  color: AppColors.darkColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: TextWidget(
                  text: "4",
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            const Spacer(),
            const TextWidget(
              text: "View All",
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.primarySkyColor,
            )
          ],
        ),
        const SizedBoxWidget(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 194,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 23,
                            decoration: BoxDecoration(
                                color: AppColors.faintSkyColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.refresh,
                                    color: AppColors.lightColor,
                                    size: 14,
                                  ),
                                  SizedBoxWidget(
                                    width: 5,
                                  ),
                                  TextWidget(
                                    text: "Running",
                                    color: AppColors.lightColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBoxWidget(
                            width: 10,
                          ),
                          ButtonWidget(
                            onClick: () {},
                            text: "Priority",
                            backgroundColor: AppColors.faintRedColor,
                            textColor: AppColors.lightColor,
                            height: 23,
                            width: 65,
                            borderRadius: 20,
                          ),
                          const Spacer(),
                          const TextWidget(
                            text: "11:00 AM - 12:00 PM",
                            color: AppColors.textGrey,
                          ),
                          const SizedBoxWidget(
                            width: 5,
                          ),
                          Image.asset(
                            AppImages.notificationsIcon,
                            height: 24,
                            width: 21,
                          )
                        ],
                      ),
                      const SizedBoxWidget(
                        height: 15,
                      ),
                      const TextWidget(
                        text: "Client Meet",
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBoxWidget(
                        height: 10,
                      ),
                      const TextWidget(
                        text:
                            "Discuss project updates and strategies with the\nclient",
                        color: AppColors.textGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      _clientImgStackWidget()
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  _clientImgStackWidget() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: profileImages.length + 1,
        itemBuilder: (context, index) {
          if (index < profileImages.length) {
            return Container(
              width: 30, // Width for each Stack item
              child: Stack(
                clipBehavior: Clip.none, // Allow overlap
                children: [
                  Positioned(
                    left: index * 10.0, // Adjust the overlap amount
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(profileImages[index]),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Display the Add Icon
            return Padding(
              padding: EdgeInsets.only(left: profileImages.length * 10.0),
              child: GestureDetector(
                  onTap: () {
                    // Handle Add action
                    print("Add icon tapped!");
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.lightColor,
                    ),
                    child: Image.asset(AppImages.addImgIcon),
                  )),
            );
          }
        },
      ),
    );
  }

  _progressOverViewWidget() {
    return Container(
        height: 158,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.darkColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.rocketImg),
              const SizedBoxWidget(
                height: 20,
              ),
              const TextWidget(
                text: "Your progress now",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.lightTxtColor,
              ),
              const SizedBoxWidget(
                height: 10,
              ),
              SizedBoxWidget(
                height: 16,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        width: 61,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                ),
              ),
              const SizedBoxWidget(
                height: 10,
              ),
              const TextWidget(
                text: "3/12 Task Completed",
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.lightTxtColor,
              )
            ],
          ),
        ));
  }
}
