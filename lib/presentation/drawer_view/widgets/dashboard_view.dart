import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_app/bloc/drawer/drawer_section_cubit.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/constants/app_strings.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

import '../../../utility/widgets/dropdown_button_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextWidget(
                            text: "Work Performance",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const MultiLayerCircularProgress(
                      percentage: 76,
                      progressValues: [
                        0.8,
                        0.6,
                        0.4,
                        0.7
                      ], // Progress for each layer
                      progressColors: [
                        AppColors.primarySkyColor,
                        AppColors.faintRedColor,
                        AppColors.orangeColor,
                        AppColors.faintSkyColor
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 38.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _dataViewWidget(
                                  AppColors.primarySkyColor, "Calls"),
                              const SizedBoxWidget(
                                height: 20,
                              ),
                              _dataViewWidget(
                                  AppColors.faintRedColor, "Conversions"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _dataViewWidget(AppColors.orangeColor, "Target"),
                              const SizedBoxWidget(
                                height: 20,
                              ),
                              _dataViewWidget(
                                  AppColors.faintSkyColor, "Payments"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBoxWidget(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            text: "Lead Conversions",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkColor,
                          ),
                          const SizedBoxWidget(
                            height: 4,
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<TabCubit>()
                                  .setSelectedTab(AppStrings.leadConversation);
                            },
                            child: Row(
                              children: [
                                const TextWidget(
                                  text: "View All",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.primarySkyColor,
                                ),
                                const SizedBoxWidget(
                                  width: 8,
                                ),
                                Image.asset(
                                  AppImages.rightArrowImg,
                                  width: 20,
                                  height: 17,
                                ),
                              ],
                            ),
                          ),
                          const SizedBoxWidget(
                            height: 4,
                          ),
                          ListView.builder(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.lightColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                              AssetImage(AppImages.profileIcon),
                                        ),
                                        SizedBoxWidget(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: "Client Name",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.darkColor,
                                            ),
                                            TextWidget(
                                              text: "Project Name",
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.greyColor,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBoxWidget(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                              context
                                  .read<TabCubit>()
                                  .setSelectedTab(AppStrings.leadConversation);
                            },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Image.asset(
                                      AppImages.rightArrowImg,
                                      height: 18,
                                      width: 22,
                                    )),
                                const TextWidget(
                                  text: "234",
                                  fontSize: 47,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackColor,
                                ),
                                const TextWidget(
                                  text: "Deals Closed",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor,
                                ),
                                //  SizedBoxWidget(height: 15,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBoxWidget(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (){
                              context
                                  .read<TabCubit>()
                                  .setSelectedTab(AppStrings.pendingPayments);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Image.asset(
                                      AppImages.rightArrowImg,
                                      height: 18,
                                      width: 22,
                                    )),
                                const TextWidget(
                                  text: "12",
                                  fontSize: 47,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackColor,
                                ),
                                const TextWidget(
                                  text: "Pending Payments",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor,
                                ),
                                //  SizedBoxWidget(height: 15,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

_dataViewWidget(Color color, String name) {
  return Row(
    children: [
      Container(
        width: 16,
        height: 12,
        decoration: BoxDecoration(color: color),
      ),
      const SizedBox(width: 5),
      TextWidget(
        text: name,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.darkColor,
      )
    ],
  );
}

class MultiLayerCircularProgress extends StatelessWidget {
  final double percentage;
  final List<double> progressValues;
  final List<Color> progressColors;

  const MultiLayerCircularProgress({
    Key? key,
    required this.percentage,
    required this.progressValues,
    required this.progressColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Iterate through layers for progress circles
        for (int i = 0; i < progressValues.length; i++)
          Padding(
            padding: EdgeInsets.all(i * 20.0),
            child: SizedBox(
              width: 150 - (i * 20),
              height: 150 - (i * 20),
              child: CircularProgressIndicator(
                value: progressValues[i],
                strokeWidth: 10.0,
                backgroundColor: progressColors[i].withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation(progressColors[i]),
              ),
            ),
          ),
        // Center Percentage Text
        Text(
          "${percentage.toInt()}%", // Display percentage
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: AppColors.darkColor,
          ),
        ),
      ],
    );
  }
}
