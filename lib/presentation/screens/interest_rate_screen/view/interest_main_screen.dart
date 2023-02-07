import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psucoop_mobile/presentation/common_widgets/sizebox_widgets.dart';

import '../../../common_widgets/template_screen.dart';
import 'widgets/interest_template.dart';
import '../api/model/bloc/interestBloc.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  State<InterestScreen> createState() => InterestState();
}

class InterestState extends State<InterestScreen> {
  @override
  void initState() {
    context.read<CoopInterestInfoBloc>().add(GetCoopcodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoopInterestInfoBloc, CoopInfoState>(
        builder: (context, state) {
      return TemplateScreen(
        //isLoading: (state is CoopCodeLoadState),
        //label: 'กรุณารอสักครู่....',
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              interestTemplate(
                  context: context,
                  title: 'เงินฝาก',
                  color: Color.fromARGB(255, 1, 50, 96)),
              sizebox(height: 10),
              interestTemplate(
                  context: context,
                  title: 'เงินฝากประจำ',
                  color: Color.fromARGB(255, 1, 96, 25)),
              sizebox(height: 10),
              interestTemplate(
                  context: context,
                  title: 'เงินกู้',
                  color: Color.fromARGB(255, 96, 1, 1))
            ],
          ),
        ),
      );
    });
  }
}
