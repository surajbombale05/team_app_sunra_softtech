import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/add_task_widget.dart';
import 'package:team_app/utility/widgets/button_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

import '../../utility/constants/app_colors.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<String> profileImages = [
    AppImages.splashIcon,
    AppImages.zigzagIconBg
  ];
  

  List<String> status = ["Completed", "To Do", "Upcoming"];

  List<String> count = ["110", "8", "12"];

  int selecetedIndex = 0;

  List<String> statusUpdateList = [
    "Running",
    "Not started",
    "Paused",
    "Completed"
  ];

  List<String> priotory = ["Low", "Mid", "High"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton:  FloatingActionButton(
        onPressed: () {
          TaskPopup.showCreateTaskPopup(context);
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxWidget(
                height: 40,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: status.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selecetedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: selecetedIndex == index
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 13.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: status[index],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: selecetedIndex == index
                                      ? AppColors.lightColor
                                      : AppColors.blackColor,
                                ),
                                const SizedBoxWidget(
                                  width: 7,
                                ),
                                Container(
                                  height: 27,
                                  decoration: BoxDecoration(
                                      color: selecetedIndex == index
                                          ? AppColors.lightColor
                                          : AppColors.lightGrayColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Center(
                                      child: TextWidget(
                                        text: count[index],
                                        color: AppColors.semiDarkColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _viewListWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _viewListWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        height: 127,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 13.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBoxWidget(
                        height: 14,
                      ),
                      const TextWidget(
                        text: "Client Meet",
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBoxWidget(
                        height: 5,
                      ),
                      const TextWidget(
                        text: "21:00 PM",
                        color: AppColors.faintGrayTextColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBoxWidget(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ButtonWidget(
                            showPreIcon: true,
                            iconImg: AppImages.tickCircleImg,
                            width: 10,
                            height: 26,
                            textColor: AppColors.whiteColor,
                            borderRadius: 20,
                            onClick: () {},
                            text: "Completed",
                            backgroundColor: AppColors.successColor,
                          ),
                          const SizedBoxWidget(
                            width: 10,
                          ),
                          ButtonWidget(
                            iconImg: AppImages.tickCircleImg,
                            width: 10,
                            height: 26,
                            textColor: AppColors.whiteColor,
                            borderRadius: 20,
                            onClick: () {},
                            text: "High",
                            backgroundColor: AppColors.faintRedColor,
                          )
                        ],
                      ),
                      const SizedBoxWidget(
                        height: 10,
                      ),
                      // _dateAndPeopleWidget()
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.more_horiz),
                        onPressed: () {
                          // show options popup
                          _showOptionsPopup(context);
                        },
                      ),
                      const Text("STACK WIDGET"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showOptionsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Center(
                        child: TextWidget(
                          text: 'Options',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _cancelIconWidget(),
                  ],
                ),
                _updateStatusWidget(),
                const SizedBoxWidget(
                  height: 5,
                ),
                _updatePriotoryWidget(),
                const SizedBoxWidget(
                  height: 12,
                ),
                _optionsButtonWidgets(),
              ],
            ),
          ),
        );
      },
    );
  }

  _optionsButtonWidgets() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ButtonWidget(
              backgroundColor: AppColors.faintRedColor.withOpacity(0.3),
              borderRadius: 30,
              height: 30,
              fontSize: 14,
              width: 15,
              textColor: AppColors.faintRedColor,
              onClick: () {
                _showDeleteTaskPopup(context);
              },
              text: "Delete Task"),
        ),
        const SizedBoxWidget(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: ButtonWidget(
              backgroundColor: AppColors.blackColor,
              borderRadius: 30,
              height: 30,
              fontSize: 14,
              width: 15,
              textColor: AppColors.whiteColor,
              onClick: () {},
              text: "Save"),
        )
      ],
    );
  }

  _updateStatusWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: "Status",
          color: AppColors.darkColor,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        const SizedBoxWidget(
          height: 10,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 8,
          children: [
            ...List.generate(
              statusUpdateList.length,
              (index) {
                return Container(
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: index == 1
                          ? AppColors.primarySkyColor
                          : AppColors.lightGrayColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextWidget(
                        text: statusUpdateList[index],
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: index == 1
                            ? AppColors.whiteColor
                            : AppColors.semiDarkColor,
                      ),
                    ));
              },
            )
          ],
        )
      ],
    );
  }

  _updatePriotoryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxWidget(
          height: 10,
        ),
        const TextWidget(
          text: "Priority",
          color: AppColors.darkColor,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        const SizedBoxWidget(
          height: 10,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 8,
          children: [
            ...List.generate(
              priotory.length,
              (index) {
                return Container(
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.lightGrayColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextWidget(
                        text: priotory[index],
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.semiDarkColor,
                      ),
                    ));
              },
            )
          ],
        )
      ],
    );
  }

  _cancelIconWidget() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightTxtColor,
            borderRadius: BorderRadius.circular(50)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: TextWidget(
              text: "x",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteTaskPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    //_deleteTask();
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextWidget(
                        text: "x",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  AppImages.alertImg,
                  height: 100,
                  width: 100,
                ),
                const SizedBoxWidget(
                  height: 6,
                ),
                const TextWidget(
                  text: "Delete Task",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                ),
                const SizedBoxWidget(
                  height: 3,
                ),
                const TextWidget(
                  text: "Are You sure you want to delete",
                  color: AppColors.textGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ButtonWidget(
                          backgroundColor: AppColors.lightGrayColor,
                          borderRadius: 30,
                          height: 30,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          width: 15,
                          textColor: AppColors.semiDarkColor,
                          onClick: () {},
                          text: "Close"),
                    ),
                    const SizedBoxWidget(
                      width: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: ButtonWidget(
                          backgroundColor: AppColors.faintRedColor,
                          borderRadius: 30,
                          height: 30,
                          fontSize: 14,
                          width: 15,
                          textColor: AppColors.lightColor,
                          onClick: () {},
                          text: "Delete"),
                    ),
                  ],
                ),
                const SizedBoxWidget(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _dateAndPeopleWidget() {
    return Row(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Image.asset(AppImages.calendarIconImg),
              const SizedBoxWidget(
                width: 8,
              ),
              const TextWidget(
                text: "14 Nov 2024",
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ),
        SizedBoxWidget(
          height: 27,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: profileImages.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index < profileImages.length) {
                return Container(
                  width: 22, // Width for each Stack item
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
        )
      ],
    );
  }
}
