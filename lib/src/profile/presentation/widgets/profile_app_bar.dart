import 'package:flutter/material.dart';

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

            PopupMenuItem(
                child: Row(),
            )

          ],
        ),

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
