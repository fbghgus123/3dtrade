import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradeApp/app/constants/app.fonts.dart';
import 'package:tradeApp/app/constants/app.strings.dart';
import 'package:tradeApp/app/pages/search/search.controller.dart';

class SearchPrev extends GetWidget<SearchController> {
  const SearchPrev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("최근 검색어", style: Fonts.w500(20)),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 4),
                  shrinkWrap: true,
                  itemCount: controller.keywords.value.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.search(controller.keywords[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.keywords[index],
                                style: Fonts.w500(14)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.clear,
                                  size: 16,
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
              const Divider(),
              Text("카테고리", style: Fonts.w500(20)),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 2.2),
                  shrinkWrap: true,
                  itemCount: AppStrings.productCategory.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.searchWithCategory(AppStrings.productCategory[index]);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Text(AppStrings.productCategory[index],
                                style: Fonts.w500(12))),
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}
