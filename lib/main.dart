import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() => runApp(MaterialApp(
    home: QRViewExample(),
    theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
            bodySmall: TextStyle(fontSize: 12, color: Colors.white),
            bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
            bodyLarge: TextStyle(fontSize: 20, color: Colors.white)))));

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  // Barcode? result;
  // QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      // controller?.pauseCamera();
    }
    // controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          // Expanded(
          //   flex: 1,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         if (result != null)
          //           Text(
          //               'Barcode Type: ${describeEnum(result!.format)}   Data: ${result?.code}')
          //         else
          //           Text('Scan a code'),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.toggleFlash();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getFlashStatus(),
          //                     builder: (context, snapshot) {
          //                       return Text('Flash: ${snapshot.data}');
          //                     },
          //                   )),
          //             ),
          //             Container(
          //               margin: EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.flipCamera();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getCameraInfo(),
          //                     builder: (context, snapshot) {
          //                       if (snapshot.data != null) {
          //                         return Text('Camera facing ${snapshot.data}');
          //                       } else {
          //                         return Text('loading');
          //                       }
          //                     },
          //                   )),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(
      children: [
        // QRView(
        //   key: qrKey,
        //   onQRViewCreated: _onQRViewCreated,
        //   overlay: QrScannerOverlayShape(
        //     borderColor: Colors.white,
        //     borderRadius: 10,
        //     borderLength: 30,
        //     borderWidth: 10,
        //     cutOutSize: scanArea,
        //   ),
        // ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.lightGreen.withOpacity(0.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // controller?.flipCamera();
                                  setState(() {});
                                },
                                icon: FutureBuilder(
                                  // future: controller?.getCameraInfo(),\
                                  future: Future.delayed(
                                      Duration(seconds: 1), () => true),

                                  builder: (context, snapshot) {
                                    return Icon(
                                      Icons.history,
                                      color: Colors.white,
                                    );
                                  },
                                )),
                            Text('History')
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // controller?.flipCamera();
                                  setState(() {});
                                },
                                icon: FutureBuilder(
                                  // future: controller?.getCameraInfo(),
                                  future: Future.delayed(
                                      Duration(seconds: 1), () => true),

                                  builder: (context, snapshot) {
                                    return Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    );
                                  },
                                )),
                            Text('Create')
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // controller?.flipCamera();
                                  setState(() {});
                                },
                                icon: FutureBuilder(
                                  // future: controller?.getCameraInfo(),
                                  future: Future.delayed(
                                      Duration(seconds: 1), () => true),

                                  builder: (context, snapshot) {
                                    return Icon(
                                      Icons.qr_code_scanner,
                                      color: Colors.white,
                                    );
                                  },
                                )),
                            Text('Batch Scan')
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // controller?.flipCamera();
                                  setState(() {});
                                },
                                icon: FutureBuilder(
                                  // future: controller?.getCameraInfo(),
                                  future: Future.delayed(
                                      Duration(seconds: 1), () => true),

                                  builder: (context, snapshot) {
                                    return Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    );
                                  },
                                )),
                            Text('Settings')
                          ],
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: IconButton(
                    onPressed: () {
                      // controller?.toggleFlash();
                      setState(() {});
                    },
                    icon: FutureBuilder(
                      // future: controller?.getFlashStatus(),
                      future: Future.delayed(Duration(seconds: 1), () => true),
                      builder: (context, snapshot) {
                        return Icon(
                          snapshot.data == true
                              ? Icons.flash_on
                              : Icons.flash_off,
                          color: Colors.white,
                        );
                      },
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   setState(() {
  //     this.controller = controller;
  //   });
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }
}
