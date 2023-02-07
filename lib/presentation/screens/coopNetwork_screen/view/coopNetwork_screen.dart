import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psucoop_mobile/data/helpers/context_ext.dart';

import '../../../common_widgets/sizebox_widgets.dart';
import '../../../common_widgets/template_screen.dart';
import '../api/coop_code/coop_code_bloc.dart';
import 'widgets/coopNetworkForm.dart';
import 'widgets/coopNetworkHeader.dart';

class CoopNetworkScreen extends StatefulWidget {
  const CoopNetworkScreen({Key? key}) : super(key: key);

  @override
  CoopNetworkState createState() => CoopNetworkState();
}

class CoopNetworkState extends State<CoopNetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoopCodeBloc, CoopCodeState>(
      builder: (context, state) {
        return TemplateScreen(
          // onWillPop: (state is CoopCodeLoadState) ? onFalse : onTrue,
          isLoading: (state is CoopCodeLoadState),
          label: 'กรุณารอสักครู่....',
          child: SingleChildScrollView(
            child: Container(
              height: context.screenHeight,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CoopId_header(),
                  sizeboxHeight(10),
                  Center(
                    child: Column(
                      children: const [
                        Text(
                          'กรุณาระบุ รหัส "สหกรณ์" ของท่าน',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizeboxHeight(10),
                  coopIdForm(context: context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
