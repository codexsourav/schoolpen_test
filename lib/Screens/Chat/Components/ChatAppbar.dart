import 'package:flutter/material.dart';
import 'package:schoolpenintern/data/Network/config.dart';

import '../../../Theme/Colors/appcolors.dart';

AppBar chatAppbar(context, {image, name, title, id, typename, onMenuselect}) {
  return AppBar(
    shadowColor: Colors.black12,
    elevation: 5,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    leadingWidth: 28,
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.purple,
        )),
    titleSpacing: 0,
    title: ListTile(
      splashColor: Colors.black12,
      onTap: () {},
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.network(
            Config.hostUrl + "/static/" + image ??
                "https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona.jpg",
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$name |  ",
            style: TextStyle(
                color: AppColors.graymdm,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text("$typename",
              style: TextStyle(color: AppColors.graymdm, fontSize: 14)),
        ],
      ),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          "Online",
          style: TextStyle(fontSize: 14),
        ),
      ),
    ),
    actions: [
      PopupMenuButton(
        onSelected: onMenuselect,
        itemBuilder: (context) => [
          PopupMenuItem(child: Text("View Profile")),
          PopupMenuItem(value: "block", child: Text("Block User")),
          PopupMenuItem(child: Text("Mute Chat")),
          PopupMenuItem(child: Text("Clear Chat")),
        ],
      ),
    ],
  );
}
