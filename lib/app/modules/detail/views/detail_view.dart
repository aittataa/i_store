import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_store/app/modules/detail/controllers/detail_controller.dart';
import 'package:i_store/app/shared/back_icon.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: Text('DetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
