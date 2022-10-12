import 'dart:async';

// import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alexia/controller/session_controller.dart';
import 'package:alexia/routes/visitor_profile.dart';

import '../../controller/router_controller.dart';

// final codeStream = StreamController<Barcode>.broadcast();

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<Scanner> {
  final _torchIconState = ValueNotifier(false);
  final SessionController sessionController = Get.find();
  final RouterController routerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Scanner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // ValueListenableBuilder<bool>(
          //   valueListenable: _torchIconState,
          //   builder: (context, state, _) => IconButton(
          //     icon: state
          //         ? const Icon(Icons.flash_on)
          //         : const Icon(Icons.flash_off),
          //     onPressed: () async {
          //       await CameraController.instance.toggleTorch();
          //       _torchIconState.value =
          //           CameraController.instance.state.torchState;
          //     },
          //   ),
          // ),
        ],
      ),
      // body: BarcodeCamera(
      //   types: const [
      //     BarcodeType.ean8,
      //     BarcodeType.ean13,
      //     BarcodeType.code128,
      //     BarcodeType.qr
      //   ],
      //   resolution: Resolution.hd720,
      //   framerate: Framerate.fps30,
      //   mode: DetectionMode.pauseVideo,
      //   position: CameraPosition.back,
      //   onScan: _handleOnScan,
      //   children: const [
      //     MaterialPreviewOverlay(animateDetection: false),
      //     BlurPreviewOverlay(),
      //   ],
      // ),
    );
  }

  // _handleOnScan(Barcode code) {
  //   sessionController.setVisitorCode(code.value.split("|")[0]);
  //
  //   return routerController.navigate(
  //     path: VisitorProfileRoute.ROUTE,
  //     replace: true,
  //   );
  // }
}
