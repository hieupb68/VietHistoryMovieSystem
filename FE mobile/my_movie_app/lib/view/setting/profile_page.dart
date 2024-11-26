import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/shareController.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_movie_app/core/utils/dialog_rate.dart';

class ProfilePage extends GetView {
  final ShareController shareController = Get.put(ShareController());

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ct) {
        return DialogRate(
          ctx: context,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0x00FF0A33),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          const SizedBox(
            width: 8,
          ),
          const SizedBox(
            height: 46,
          ),
          SvgPicture.asset(
            'assets/svg/avatar.svg',
            height: 56,
          ),
          Obx(()=> shareController.isLogin.value
              ? Column(
            children: [
              Text(
                shareController.username.value,
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                'new_member'.tr ?? '',
                style:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          )
              : Column(
            children: [
              const SizedBox(height: 8,),
              Text('not_logged_in'.tr),
              const SizedBox(height: 8,),
              InkWell(
                onTap: ()=> Get.toNamed(AppRouter.LOGIN),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Text('login'.tr),
                ),
              ),
            ],
          ),),
          const SizedBox(
            height: 46,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'setting'.tr,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
               color: Colors.grey,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26, // Màu shadow
                      offset: Offset(0, 4), // Vị trí shadow (x, y)
                      blurRadius: 10, // Độ mờ của shadow
                      spreadRadius: 2, // Độ lan của shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () async => await _launchPrivacyPolicyURL(),
                      child: SettingItem(
                        label: 'privacy_policy'.tr,
                        leadingAsset: "assets/svg/gpp_maybe.svg",
                        isDarkMode: Get.isDarkMode,
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () async => await Share.share(
                          "https://pub.dev/packages/share_plus"),
                      child: SettingItem(
                        label: 'share'.tr,
                        leadingAsset: "assets/svg/share.svg",
                        isDarkMode: Get.isDarkMode,
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => _showImageDialog(context),
                      child: SettingItem(
                        label: 'rate'.tr,
                        leadingAsset: "assets/svg/star_half.svg",
                        isDarkMode: Get.isDarkMode,
                      ),
                    ),

                    Obx(()=>Visibility(
                      visible: shareController.isLogin.value,
                      child: Column(
                        children: [
                          const Divider(),
                          InkWell(
                            onTap: () => shareController.logout(),
                            child:Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              // decoration:  BoxDecoration(
                              //     borderRadius: const BorderRadius.all(Radius.circular(12)),
                              //     color: isDarkMode? Colors.black: Colors.grey[100],
                              // ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/svg/logout.svg",color: Colors.blue,),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'logout'.tr,
                                        style: const TextStyle(
                                          // color: Color(0xFF2970E4),
                                          fontFamily: "ComicSansMS",
                                          fontSize: 18,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

_launchPrivacyPolicyURL() async {
  const url = 'https://nmhglobal.netlify.app/policy';
  Uri uri = Uri.parse(url); // Thay đổi đường link của bạn ở đây
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

class SettingItem extends StatelessWidget {
  String label;
  String leadingAsset;
  String? actionAsset;
  bool isDarkMode;
  SettingItem(
      {super.key,
      required this.label,
      required this.leadingAsset,
      this.actionAsset,
      required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      // decoration:  BoxDecoration(
      //     borderRadius: const BorderRadius.all(Radius.circular(12)),
      //     color: isDarkMode? Colors.black: Colors.grey[100],
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(leadingAsset,color: Colors.blue,),
              const SizedBox(
                width: 16,
              ),
              Text(
                label,
                style: const TextStyle(
                  // color: Color(0xFF2970E4),
                  fontFamily: "ComicSansMS",
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          actionAsset == null
              ? Container()
              : Row(
                  children: [
                    SvgPicture.asset(actionAsset!,height: 18,fit: BoxFit.fitHeight,),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
