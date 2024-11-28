import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/widgets/circular_percent_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';
// import 'package:percent';

class YourTargetWidget extends StatelessWidget {
  const YourTargetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
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
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "New Year Target",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkColor,
                    ),
                    SizedBoxWidget(height: 15),
                    Row(
                      children: [
                        TextWidget(
                          text: "26-November-2024",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.semiDarkColor,
                        ),
                        SizedBoxWidget(
                          width: 15,
                        ),
                        TextWidget(
                          text: "05-January-2025",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.semiDarkColor,
                        )
                      ],
                    ),
                    SizedBoxWidget(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: CircularProgressBar(
                            percentage: 45, 
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              TextWidget(
                                text: "₹11,50,454",
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkColor,
                              ),
                              TextWidget(
                                text: "of",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.semiDarkColor,
                              ),
                              TextWidget(
                                text: "₹25,00,000",
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}

