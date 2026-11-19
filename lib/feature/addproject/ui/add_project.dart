
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/app_color.dart';
import 'package:todo_app/core/app_text_style.dart';
import 'package:todo_app/feature/tasks/data/services/task_service.dart';
import 'package:todo_app/feature/tasks/models/task_model.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final TaskService _taskService = TaskService();

  String selectedGroup = 'Work';
  DateTime? selectedDate;

  bool isLoading = false;

  Future<void> selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> addProject() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('please_enter_project_name'.tr()),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final task = TaskModel(
        id: '',
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        isCompleted: false,
        category: selectedGroup,
        dueDate: selectedDate,
      );

      await _taskService.addTask(task);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('project_added_successfully'.tr()),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${'error'.tr()}: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final textColor = colors.onSurface;
    final cardColor = theme.cardColor;

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: cardColor,
      hintStyle: TextStyle(
        color: colors.onSurfaceVariant,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),

        title: Text(
          'add_project'.tr(),
          style: AppTextStyle.bold16.copyWith(
            color: textColor,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Project Name
              Text(
                'project_name'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _titleController,
                style: TextStyle(color: textColor),
                decoration: inputDecoration.copyWith(
                  hintText: 'enter_project_name'.tr(),
                ),
              ),

              const SizedBox(height: 20),

              // Group
              Text(
                'group'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedGroup,
                    isExpanded: true,
                    dropdownColor: cardColor,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                    ),

                    items: [
                      DropdownMenuItem(
                        value: 'Work',
                        child: Text('work'.tr()),
                      ),
                      DropdownMenuItem(
                        value: 'Personal',
                        child: Text('personal'.tr()),
                      ),
                      DropdownMenuItem(
                        value: 'Study',
                        child: Text('study'.tr()),
                      ),
                    ],

                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedGroup = value;
                        });
                      }
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Due Date
              Text(
                'due_date'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                readOnly: true,
                style: TextStyle(color: textColor),
                onTap: selectDate,

                decoration: inputDecoration.copyWith(
                  hintText: selectedDate == null
                      ? 'select_date'.tr()
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: colors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Description
              Text(
                'description'.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: _descriptionController,
                maxLines: 4,
                style: TextStyle(color: textColor),

                decoration: inputDecoration.copyWith(
                  hintText: 'enter_project_description'.tr(),
                  alignLabelWithHint: true,
                ),
              ),

              const SizedBox(height: 30),

              // Add Button
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: isLoading ? null : addProject,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.main,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'add_project'.tr(),
                          style: AppTextStyle.bold16.copyWith(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
