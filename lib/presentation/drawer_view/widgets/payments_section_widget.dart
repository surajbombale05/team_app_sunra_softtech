import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/dropdown_button_widget.dart';
import 'package:team_app/utility/widgets/dropdown_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class PaymentsSectionWidget extends StatelessWidget {
  const PaymentsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.darkColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        AppImages
                            .blinkImg, // Replace with your left image asset
                        fit: BoxFit.contain, // Adjust the size as needed
                        height: 100, // Set desired height
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        AppImages
                            .vectorImg, // Replace with your right image asset
                        fit: BoxFit.contain, // Adjust the size as needed
                        height: 100, // Set desired height
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 25, right: 25),
                child: Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: "Total Amount received",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor,
                            ),
                            SizedBoxWidget(
                              height: 10,
                            ),
                            TextWidget(
                              text: "₹ 3,585,6030",
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkColor,
                            ),
                          ],
                        ),
                        Image.asset(
                          AppImages.downloadBigImg,
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                // Header Row with Title and Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Recent Received Payments",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkColor,
                    ),
                    // Uncomment the dropdown code when implemented
                    // CustomDropdown(
                    //   items: filters,
                    //   selectedItem: selectedFilter,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       selectedFilter = value!;
                    //     });
                    //   },
                    // ),
  
                   

                  ],
                ),
                const SizedBoxWidget(height: 10),

                // List of Payments
                ListView.builder(
                  itemCount: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              // Circular Avatar
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.faintGrayColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: "CN",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.darkColor,
                                  ),
                                ),
                              ),
                              const SizedBoxWidget(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: "Clients Name",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    TextWidget(
                                      text: "Project Name",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyColor,
                                    ),
                                  ],
                                ),
                              ),

                              // Payment Details
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextWidget(
                                    text: "₹ 31,585",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.successColor,
                                  ),
                                  TextWidget(
                                    text: "11 Nov 2023",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
