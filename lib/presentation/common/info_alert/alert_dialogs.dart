import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppDialogs {
  static _dialog({
    required Widget body,
    Widget? title,
    List<Widget>? actions,
    dismissible = false,
  }) {
    return Get.dialog(
      PlatformAlertDialog(
        title: title,
        content: body,
        actions: actions,
      ),
      barrierDismissible: dismissible,
    );
  }

  static showEndDisputeDialog() {
    return _dialog(
      title: const Text("Close dispute?"),
      body: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text.rich(
          TextSpan(
            text: "Click ",
            children: [
              TextSpan(
                text: "Agree ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "to release funds to the "),
              TextSpan(
                text: "OTHER PARTY.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      actions: [
        PlatformDialogAction(
          child: const Text("Agree", style: TextStyle(color: Colors.red)),
          onPressed: () => Get.back(result: "Agree"),
        ),
        PlatformDialogAction(
          child: const Text("Cancel"),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  static showPromptDialog({
    required String message,
    required Function() onActionClicked,
    String label = "Yes",
  }) {
    _dialog(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(message),
      ),
      title: const Text("Action required!"),
      actions: [
        PlatformDialogAction(
          child: const Text("Cancel"),
          onPressed: () => Get.back(),
        ),
        PlatformDialogAction(
          child: Text(label, style: const TextStyle(color: Colors.red)),
          onPressed: onActionClicked,
        ),
      ],
    );
  }

  static showAlert({
    String title = "Action required!",
    String actionLabel = "Okay",
    required String message,
    required Function() onActionClicked,
  }) {
    _dialog(
      title: Text(title),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(message),
      ),
      actions: [
        PlatformDialogAction(
          child: Text(actionLabel),
          onPressed: onActionClicked,
        ),
      ],
    );
  }

  static success(String message) {
    return _dialog(
      title: SizedBox(
        height: 40,
        child: Lottie.asset(
          "assets/lottie/success.json",
          frameRate: FrameRate(60),
        ),
      ),
      body: Text(message),
      actions: [
        PlatformDialogAction(
          child: const Text("Okay!"),
          onPressed: () => Get.back(result: "OK"),
        ),
      ],
    );
  }

  static deleted(message) {
    return _dialog(
      title: SizedBox(
        height: 40,
        child: Lottie.asset(
          "assets/lottie/bin.json",
          frameRate: FrameRate(60),
        ),
      ),
      body: Text("$message"),
      actions: [
        PlatformDialogAction(
          child: const Text("Okay!"),
          onPressed: () => Get.back(result: "OK"),
        ),
      ],
    );
  }

  static error(message) {
    return _dialog(
      title: SizedBox(
        height: 40,
        child: Lottie.asset(
          "assets/lottie/error.json",
          frameRate: FrameRate(60),
        ),
      ),
      body: Text(message),
      actions: [
        PlatformDialogAction(
          child: const Text("Okay!"),
          onPressed: () => Get.back(result: "OK"),
        ),
      ],
    );
  }

  static info(message) {
    return _dialog(
      title: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.deepOrange.shade50,
            radius: 20,
            child: const Icon(
              Icons.info_outlined,
              size: 35,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 10),
          const Text("Heya!"),
        ],
      ),
      body: Text(message),
      actions: [
        PlatformDialogAction(
          child: const Text("Okay!"),
          onPressed: () => Get.back(result: "OK"),
        ),
      ],
    );
  }

  static warning(
    message, {
    String actionText = "Okay!",
    bool hasCancel = false,
  }) {
    return _dialog(
      title: const SizedBox(
        height: 40,
        child: Icon(Icons.warning, size: 35, color: Colors.orangeAccent),
      ),
      dismissible: true,
      body: Text(message),
      actions: [
        if (hasCancel)
          PlatformDialogAction(
            child: const Text("Stay here"),
            onPressed: () => Get.back(result: "Cancel"),
          ),
        PlatformDialogAction(
          child: Text(actionText),
          onPressed: () => Get.back(result: "OK"),
        ),
      ],
    );
  }

  static lottieLoader() {
    Get.dialog(
      Transform.scale(
        scale: .23,
        child: Lottie.asset("assets/lottie/loading.json",
            frameRate: FrameRate(60)),
      ),
      barrierDismissible: false,
    );
  }

  static lottieSuccess(message) {
    Get.dialog(
      Transform.scale(
        scale: .23,
        child: Lottie.asset(
          "assets/lottie/success.json",
          frameRate: FrameRate(60),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static otpError(VoidCallback press) {
    Get.dialog(
      Center(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: LottieBuilder.asset(
                    'assets/lottie/error.json',
                    height: 70,
                    width: 80,
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: GestureDetector(
                    onTap: press,
                    child: const Text(
                      'Try Again',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // static showWelcomePrompt({required BuildContext context}) {
  //   final size = MediaQuery.of(context).size;
  //   Get.dialog(
  //     barrierDismissible: true,
  //     Center(
  //       child: Center(
  //         child: Container(
  //           padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
  //           height: size.width / 1.3,
  //           width: size.width * 0.9,
  //           color: Colors.white,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               Center(
  //                 child: SizedBox(
  //                   height: 80,
  //                   width: 80,
  //                   child: LottieBuilder.asset(
  //                     'assets/lottie/wave.json',
  //                     height: 70,
  //                     width: 80,
  //                   ),
  //                 ),
  //               ),
  //               Text(
  //                 'Welcome to Chopmoney!',
  //                 style: Theme.of(context).textTheme.displayLarge!.copyWith(
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 22,
  //                     ),
  //               ),
  //               const SizedBox(height: 20),
  //               Text(
  //                 "You're a step closer to securing your expenditure. Tap 'Make a budget!' to choose when and how much you want to get paid.",
  //                 textAlign: TextAlign.center,
  //                 style: Theme.of(context).textTheme.displaySmall!.copyWith(
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.w300,
  //                       fontSize: 15,
  //                     ),
  //               ),
  //               const Spacer(),
  //               SizedBox(
  //                 width: MediaQuery.of(context).size.width,
  //                 child: CustomButtons.primary(
  //                     text: 'Make a budget!',
  //                     onPressed: () {
  //                       Get.back();
  //                       Get.offAndToNamed(CreateBudgetScreen.id);
  //                     }),
  //               ),
  //               const Spacer(),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

enum ConfirmAction { CONFIRM, CANCEL }