import 'package:flutter/material.dart';
import 'package:schoolpenintern/Screens/Parents/Components/Abhil_widgets/about_card.dart';
import 'package:schoolpenintern/Screens/Parents/Components/Abhil_widgets/tile_widget.dart';
import 'package:schoolpenintern/Screens/Parents/Components/Sourav_widgets/user_contact_info_box.dart';
import 'package:schoolpenintern/Screens/Parents/Components/Sourav_widgets/user_idinfo_box.dart';
import 'package:schoolpenintern/Screens/Parents/Components/Vishwajeet_widgets/search_widget.dart';
import 'package:schoolpenintern/Screens/management/components/profile_card.dart';
import 'package:schoolpenintern/Screens/management/constant/colors.dart';


class ManagementProfile extends StatelessWidget {
  ManagementProfile({super.key});

  final TextEditingController _controller = TextEditingController();

  final List<String> texts = ["Profile", "School Performance"];

  final List<Map<String, dynamic>> parents = [
    {
      "id": 1,
      "image":
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "name": "Jone Doe",
    }
  ];
  final int tabindex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Search(
              controller: _controller,
              backGroundLightColor: AppColors.parentboxcolor,
              searchIconColor: AppColors.parentDarkcolor,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ProfileCard(
              backGroundColor: AppColors.parentboxcolor,
              schholName: 'Delhi Public School',
              isStudent: true,
              std: 'VI to XII',
              buttonColor: AppColors.parentDarkcolor,
              onCall: () {},
              onMessage: () {},
              image:
                  'https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=',
            ),

            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: texts
                          .map(
                            (e) => TileWidget(
                              text: e,
                              fill: true,
                              activeTextColor: Colors.white,
                              active: e == texts[tabindex],
                              activeColor: AppColors.parentDarkcolor,
                            ),
                          )
                          .toList(),
                    )),
                const SizedBox(height: 20),
                AboutCard(
                    bgcolor: AppColors.parentboxcolor,
                    description:
                        "Love to experiment with new ideas, enjoy the process to discovery, I am very enthusiastic to teach new concepts in the field of chemistry")
              ],
            ),
            // Abhill Widgets End====

            // Sourav Widgets Start====
            const SizedBox(height: 20),
            UserIdInfo(
              onEditClick: () {},
              backgroundColor: AppColors.parentboxcolor,
            ),
            const SizedBox(height: 20),
            UserConatctBox(
              backgroundColor: AppColors.parentboxcolor,
              onEditClick: () {},
              emailText: "codexsourav0w@gmail.com",
              headingText: "Contact",
              locationAddress: "17, Kolkata , West Bengal 700001",
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
