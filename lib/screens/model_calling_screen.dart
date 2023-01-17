import 'dart:convert';

import 'package:devlopment_app/app_data/list_data.dart';
import 'package:devlopment_app/model/common_model.dart';
import 'package:flutter/material.dart';

class ModelCallingScreen extends StatefulWidget {
  const ModelCallingScreen({Key? key}) : super(key: key);

  @override
  State<ModelCallingScreen> createState() => _ModelCallingScreenState();
}

class _ModelCallingScreenState extends State<ModelCallingScreen> {
  CommonModel? commonModel;

  @override
  void initState() {
    // TODO: implement initState
    commonModel = CommonModel.fromJson(AppData.listData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Model Calling Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "course: ${commonModel!.course!}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: commonModel!.studentList!.length,
                padding: const EdgeInsets.all(15),
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "First Name: ${commonModel!.studentList![index].name}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Age: ${commonModel!.studentList![index].age}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Middle Name: ${commonModel!.studentList![index].fatherName}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Last Name: ${commonModel!.studentList![index].surName}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
