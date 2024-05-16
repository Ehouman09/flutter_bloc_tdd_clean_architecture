import 'package:educationapp/core/common/app/providers/tab_navigator.dart';
import 'package:educationapp/core/common/widgets/popup_item.dart';
import 'package:educationapp/core/extensions/context_extention.dart';
import 'package:educationapp/core/res/colours.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {

  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: const Text(
        "Account",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24
        ),
      ),
      actions: [

        PopupMenuButton(
          offset: Offset(0, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          itemBuilder: (_) => [

            PopupMenuItem<void>(
                child: const PopupItem(
                  title: 'Edit Profile',
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Colours.neutralTextColour,
                  ),
                ),
                onTap: () => context.push(const  Placeholder()),
            ),

            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Notification',
                icon: Icon(
                  IconlyLight.notification,
                  color: Colours.neutralTextColour,
                ),
              ),
              onTap: () => context.push(const  Placeholder()),
            ),

            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Edit Profile',
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colours.neutralTextColour,
                ),
              ),
              onTap: () => context.push(const  Placeholder()),
            ),

            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Edit Profile',
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colours.neutralTextColour,
                ),
              ),
              onTap: () => context.push(const  Placeholder()),
            ),

          ],
        ),

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
