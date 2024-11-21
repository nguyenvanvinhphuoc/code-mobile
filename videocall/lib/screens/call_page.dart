import 'package:flutter/material.dart';
import 'package:videocall/constants/current_user.dart';
import 'package:videocall/constants/routes.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map<String, String>;
    final callID = arguments[PageParam.call_id] ?? '';
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
          appID: 1497460462,
          appSign:
              '40e3c32dae1ed756ff6e9559910e762df0383d811fd9ffa9863d4bf2d53d33cb',
          callID: callID,
          userID: currentUser.id,
          userName: currentUser.name,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()),
    );
  }
}
