import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/Text_form_field_label.dart';
import 'package:team_app/utility/widgets/button_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';
import 'package:team_app/utility/widgets/underline_dropdown_widget.dart';

class TaskPopup {
  static TextEditingController titleController = TextEditingController();

  static String selectedClient = "Select Client";
  static List<String> clients = [
    "Select Client",
    "Client A",
    "Client B",
    "Client C"
  ];

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
                _clientWidget(context),
                const SizedBoxWidget(height: 10),
                _projectWidget(context),
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
        SizedBoxWidget(
          height: 11,
        ),
        _assignWidget(),
        SizedBoxWidget(
          height: 12,
        ),
        _tagWidget(),
        SizedBoxWidget(
          height: 12,
        ),
        _saveTaskButtonWidget(),
      ],
    );
  }

  static _assignWidget() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Image.asset(
                AppImages.profileUserImg,
                height: 13,
                width: 13,
              ),
              const SizedBoxWidget(
                width: 4,
              ),
              const TextWidget(
                text: "Assigne",
                color: AppColors.textGrey,
                fontSize: 14,
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
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 233, 227, 227)),
                      child: const Center(
                        child: TextWidget(
                          text: "+",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    //  ButtonWidget(onClick: (){

                    //  }, text: "ASSINER Name",
                    //  width: 2,

                    //  )
                  ],
                ),
              ],
            ))
      ],
    );
  }

  static _tagWidget() {
    return Row(
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
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 233, 227, 227)),
                      child: const Center(
                        child: TextWidget(
                          text: "+",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 12,
                    //   width: 33,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       color: AppColors.lightColor),
                    // ),
                  ],
                ),
              ],
            ))
      ],
    );
  }

 static  _saveTaskButtonWidget() {
    return ButtonWidget(
      isDark:true,
      height: 44,
      textColor: AppColors.whiteColor,
      borderRadius: 30,
      onClick: () {}, text: "Save Task");
  }

  static Widget _projectWidget(BuildContext context) {
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
                addProjectWidget(context);
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

  static _clientWidget(BuildContext context) {
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
                addClientWidget(context);
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

  static void addClientWidget(BuildContext context) {
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
                      text: 'Add Client',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                TextFormFieldLabel(
                  controller: TextEditingController(),
                  headingText: "Client Name",
                  hintText: "Name of the client",
                ),
                const SizedBoxWidget(
                  height: 7,
                ),
                TextFormFieldLabel(
                  controller: TextEditingController(),
                  headingText: "Mobile no.",
                  hintText: "+ 91 8346493475",
                ),
                const SizedBoxWidget(
                  height: 7,
                ),
                TextFormFieldLabel(
                  controller: TextEditingController(),
                  headingText: "Email",
                  hintText: "user@email.com",
                ),
                const SizedBoxWidget(
                  height: 7,
                ),
                TextFormFieldLabel(
                  controller: TextEditingController(),
                  headingText: "Address",
                  hintText: "address here",
                ),
                const SizedBoxWidget(
                  height: 17,
                ),
                ButtonWidget(
                  onClick: () {},
                  text: "Add Client",
                  backgroundColor: AppColors.darkColor,
                  textColor: AppColors.lightColor,
                  borderRadius: 30,
                  width: 10,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 44,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static void addProjectWidget(BuildContext context) {
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
                      text: 'Add Project',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                TextFormFieldLabel(
                  controller: TextEditingController(),
                  headingText: "Project Name",
                  hintText: "Name of the project",
                ),
                const SizedBoxWidget(
                  height: 7,
                ),
                // client dropdown
                UnderlineDropdown(
                  label: "Client",
                  items: clients,
                  selectedItem: selectedClient,
                  onChanged: (value) {
                    //     setState(() {
                    //    selectedClient = value!;
                    // });
                  },
                ),

                const SizedBoxWidget(
                  height: 17,
                ),
                ButtonWidget(
                  onClick: () {},
                  text: "Add Project",
                  backgroundColor: AppColors.darkColor,
                  textColor: AppColors.lightColor,
                  borderRadius: 30,
                  width: 10,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 44,
                ),
                SizedBoxWidget(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
