  import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class TaskPopup {
   static TextEditingController titleController = TextEditingController();
  static void showCreateTaskPopup(BuildContext context) {
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
                    const TextWidget(
                      text: 'Create New Task',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                _titleWidget(),
                _clientWidget(),
                const SizedBoxWidget(height: 10),
                _projectWidget(),
                const SizedBoxWidget(
                  height: 10,
                ),
                _taskDetailsWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
 
static _taskDetailsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: "Task Details",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
        _assignWidget(),
        _tagWidget(),
      ],
    );
  }

 static _assignWidget(){
    return Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Image.asset(
                    AppImages.profileUserImg,
                    height: 12,
                    width: 12,
                  ),
                  const SizedBoxWidget(
                    width: 4,
                  ),
                  const TextWidget(
                    text: "Assigne",
                    color: AppColors.textGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.lightColor),
                          child: const TextWidget(
                            text: "+",
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Container(
                          height: 12,
                          width: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.lightColor),
                        ),
                        
                      ],
                    ),
                  ],
                ))
          ],
        );
  }

 static _tagWidget(){
  return  Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Image.asset(
                    AppImages.tagImg,
                    height: 12,
                    width: 12,
                  ),
                  const SizedBoxWidget(
                    width: 4,
                  ),
                  const TextWidget(
                    text: "Tags",
                    color: AppColors.textGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.lightColor),
                          child: const TextWidget(
                            text: "+",
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Container(
                          height: 12,
                          width: 33,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.lightColor),
                        ),
                        
                      ],
                    ),
                  ],
                ))
          ],
        );
 }

static Widget _projectWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: "Project",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                      value: '1', child: TextWidget(text: 'project 1')),
                  DropdownMenuItem(
                      value: '2', child: TextWidget(text: 'project 2')),
                ],
                onChanged: (value) {},
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: const InputDecoration(
                  hintText: 'Select Project',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyColor),
                  ),
                ),
              ),
            ),
            const SizedBoxWidget(width: 10),
            InkWell(
              onTap: () {
                print("add Project : ");
              },
              child: const Row(
                children: [
                  Icon(Icons.add),
                  SizedBoxWidget(
                    width: 4,
                  ),
                  TextWidget(
                    text: "Add Project",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.semiDarkColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

static _titleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxWidget(height: 20),
        const TextWidget(
          text: "Title",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
        // SizedBoxWidget(height: 5,),
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: "Brief Project with team",
            hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrey),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColor),
            ),
          ),
        ),
        const SizedBoxWidget(height: 15),
      ],
    );
  }

  static _clientWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: "Client",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Client 1')),
                  DropdownMenuItem(value: '2', child: Text('Client 2')),
                ],
                onChanged: (value) {},
                icon: const Icon(Icons.keyboard_arrow_down),
                decoration: const InputDecoration(
                  hintText: 'Select Client',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyColor),
                  ),
                ),
              ),
            ),
            const SizedBoxWidget(width: 10),
            InkWell(
              onTap: () {
                print("add Client : ");
              },
              child: const Row(
                children: [
                  Icon(Icons.add),
                  SizedBoxWidget(
                    width: 4,
                  ),
                  TextWidget(
                    text: "Add Client",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.semiDarkColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}