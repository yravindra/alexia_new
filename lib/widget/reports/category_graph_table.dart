import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../interface/category_graph_data.dart';
import 'category_table_header.dart';

class CategoryGraphTable extends StatelessWidget {
  final List<CategoryGraphData> graphData;

  const CategoryGraphTable({
    Key? key,
    required this.graphData,
  }) : super(key: key);


  _buildTableBody(CategoryGraphData graph) {
    return Container(
      color: Colors.grey.withOpacity(0.20),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  graph.category,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color(0xff484848),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  graph.catName,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color(0xff484848),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  graph.visitorCount,
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xff484848),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(
            color: const Color(0xff1C2C39).withOpacity(0.20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CategoryTableHeader(
            topRadius: 10.w,
          ),
          for(final graph in graphData)
            _buildTableBody(graph),
        ],
      ),
    );
  }

}
