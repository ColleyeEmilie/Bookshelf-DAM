import 'package:flutter/material.dart';
import '../widgets/navigation/bottom_navigation.dart';
import 'package:scan/scan.dart';
import 'package:bookshelf/widgets/background.dart';
import 'package:bookshelf/style/colors.dart';

class ScanScreen extends StatelessWidget {
  ScanScreen({super.key});
  static const String routeName = '/scan';
  ScanController controller = ScanController();
  String qrcode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        leading: null,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: kSecondaryColor, //change your color here
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child : SingleChildScrollView(
                child: Column(
                  children: [

                    const SizedBox(height: 140),
                    SizedBox(
                      width: 300, // custom wrap size
                      height: 300,
                      child: ScanView(
                        controller: controller,
                        scanAreaScale: .7,
                        scanLineColor: Colors.green.shade400,
                        onCapture: (data) {
                          debugPrint(data);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
