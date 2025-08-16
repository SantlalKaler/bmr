import 'package:bmr/controllers/todo_controller.dart';
import 'package:bmr/ui/constants/dimens_constants.dart';
import 'package:bmr/ui/elements/app_loader.dart';
import 'package:bmr/ui/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/task_controller.dart';
import '../../../controllers/user_controller.dart';
import '../widgets/top_app_bar.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TaskController taskController = Get.find();
  TodoController todoController = Get.find();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      taskController.changeTabIndex(tabController.index);
      getTodoList();
    });
    getTodoList();
  }

  void getTodoList() async {
    UserController userController = Get.find();
    String empId = userController.user?.eId ?? '';
    if (tabController.index == 0) {
      await todoController.getMyTodoList(
          empId: empId, assigneeType: "", priority: "", status: "");
    } else {
      await todoController.getTasksAssignedByMe(
          empId: empId, assigneeType: '', priority: '', status: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
        init: TaskController(),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: scaffoldBackgroundColor,
              appBar: const PreferredSize(
                preferredSize: Size(double.infinity, 120),
                child: TopAppBar(
                  title: "To do List",
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(DimensConstants.screenPadding),
                child: Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      tabs: const [
                        Tab(text: "My To-do List"),
                        Tab(text: "Assigned By Me"),
                      ],
                    ),
                    Obx(
                      () => Expanded(
                        child: todoController.loading.isTrue
                            ? AppLoader()
                            : TabBarView(
                                controller: tabController,
                                children: const [
                                  Center(child: Text("No to-do tasks found")),
                                  Center(child: Text("No to-do tasks found")),
                                ],
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
