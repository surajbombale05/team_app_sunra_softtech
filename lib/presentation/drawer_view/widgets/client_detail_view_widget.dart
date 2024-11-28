import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class ClientDetailViewWidget extends StatelessWidget {
  const ClientDetailViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back_ios),
            Align(
              alignment: Alignment.center,
              child: TextWidget(
                text: "Client name",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
            ),
            SizedBoxWidget(height: 24),
            TextWidget(
              text: "Client Details",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBoxWidget(height: 10),
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
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    _expandedDataWidget("Email", "user@gmail.com"),
                    SizedBoxWidget(
                      height: 10,
                    ),
                    _expandedDataWidget("Phone Number", "+91 945345393"),
                    SizedBoxWidget(
                      height: 10,
                    ),
                    _expandedDataWidget("Address",
                        "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016"),
                  ],
                ),
              ),
            ),
            SizedBoxWidget(height: 20),
            TextWidget(
              text: "Payments",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.darkColor,
            ),
            Row(
              children: [
                TextWidget(
                  text: "Total",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
                SizedBoxWidget(
                  width: 15,
                ),
                TextWidget(
                  text: "₹ 5,00,000",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                )
              ],
            ),
            SizedBoxWidget(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.editEventFeildColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Dues",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.semiDarkColor,
                          ),
                          TextWidget(
                            text: "₹ 67,000",
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.faintRedColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBoxWidget(
                  width: 15,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.successColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Paid",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.semiDarkColor,
                          ),
                          TextWidget(
                            text: "₹ 2,77,000",
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.successColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBoxWidget(
              height: 20,
            ),
            TextWidget(
              text: "Projects",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.darkColor,
            ),
            SizedBoxWidget(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.symmetric(vertical:12.0 , horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  text: "Project 1",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkColor,
                                ),
                                Image.asset(AppImages.rightArrowImg, height: 17,),
                              ],
                            ),
                            TextWidget(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: AppColors.greyColor,
                            ),
                            TextWidget(
                              text: "Category",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.semiDarkColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _expandedDataWidget(String key, String value) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: TextWidget(
              text: key,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor,
            )),
        Expanded(
            flex: 7,
            child: TextWidget(
              text: value,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.darkColor,
            )),
      ],
    );
  }
}
