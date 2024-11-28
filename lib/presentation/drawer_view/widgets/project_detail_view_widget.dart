import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/button_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class ProjectDetailViewWidget extends StatelessWidget {
  const ProjectDetailViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios)),
                SizedBoxWidget(
                  height: 20,
                ),
                TextWidget(
                  text: "Project 1 ",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                ),
                SizedBoxWidget(height: 4),
                TextWidget(
                  text: "Clients Name",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                SizedBoxWidget(height: 20),
                _expandedDataWidget(
                    "Status",
                    AppImages.recordCircle,
                    TextWidget(
                      text: "On Progress",
                      color: AppColors.successColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBoxWidget(height: 10),
                _expandedDataWidget(
                    "Due Date",
                    AppImages.calendarIconImg,
                    TextWidget(
                      text: "24 Nov 2024",
                      color: AppColors.darkColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBoxWidget(height: 10),
                _expandedDataWidget(
                    "Assigne",
                    AppImages.profileUserImg,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.lightGrayColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: AppColors.faintGrayColor,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              SizedBoxWidget(
                                width: 5,
                              ),
                              TextWidget(
                                text: "John Doe",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkColor,
                              ),
                              SizedBoxWidget(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBoxWidget(
                          width: 10,
                        ),
                        Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrayColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: TextWidget(text: "+"),
                          ),
                        )
                      ],
                    )),
                SizedBoxWidget(height: 10),
                _expandedDataWidget(
                  "Tags",
                  AppImages.tagImg,
                  Row(
                    children: [
                      ButtonWidget(
                        showPreIcon: true,
                        onClick: () {},
                        iconImg: AppImages.mobileIcon,
                        text: "App",
                        backgroundColor:
                            const Color(0xFFF66001A).withOpacity(0.3),
                        width: 5,
                        height: 22,
                      ),
                      const SizedBoxWidget(
                        width: 5,
                      ),
                      ButtonWidget(
                        showPreIcon: true,
                        iconImg: AppImages.airplaneSquare,
                        onClick: () {},
                        text: "Travel",
                        backgroundColor:
                            const Color(0xFF006AFF1A).withOpacity(0.3),
                        width: 5,
                        height: 22,
                      ),
                    ],
                  ),
                ),
                SizedBoxWidget(height: 20),
                TextWidget(
                  text: "Description",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
                SizedBoxWidget(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrayColor),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBoxWidget(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextWidget(
                      text: "textAttachment(2)",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor,
                    )),
                    SizedBoxWidget(
                      width: 10,
                    ),
                    Image.asset(AppImages.downloadIcon),
                    SizedBoxWidget(
                      width: 10,
                    ),
                    TextWidget(
                      text: "Download All",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primarySkyColor,
                    ),
                  ],
                ),
                SizedBoxWidget(
                  height: 20,
                ),
                GridView.builder(
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.9,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.lightGrayColor),
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppImages.pdfImg),
                            SizedBoxWidget(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextWidget(
                                    text: "Proposal.pdf",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text: "1,5 MB",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.semiDarkColor,
                                      ),
                                      TextWidget(
                                        text: "Download",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.semiDarkColor,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBoxWidget(
                  height: 16,
                ),
                TextWidget(
                  text: "Timeline",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
                SizedBoxWidget(
                  height: 10,
                ),
                _timeLineWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

 _timeLineWidget(){
  return TextWidget(text: "Timeline",);
 }


  _expandedDataWidget(String key, String img, Widget value) {
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: Row(
              children: [
                Image.asset(img),
                SizedBoxWidget(
                  width: 7,
                ),
                TextWidget(
                  text: key,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
              ],
            )),
        Expanded(flex: 7, child: value),
      ],
    );
  }
}
