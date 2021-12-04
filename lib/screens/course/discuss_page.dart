import 'package:course/components/importing_packages.dart';
import 'package:flutter/material.dart';

class DiscussPage extends StatelessWidget {
  const DiscussPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child:  Center(
      child: CustomTextWidget("Discuss page"),
    ));
  }
}
