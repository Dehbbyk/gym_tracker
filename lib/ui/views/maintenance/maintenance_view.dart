import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_tracker/core/models/maintenance_model.dart';
import 'package:gym_tracker/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'maintenance_viewmodel.dart';

class MaintenanceView extends StackedView<MaintenanceViewModel> {
  const MaintenanceView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MaintenanceViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/arrow_left.svg",
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Maintenance",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      enabled: true,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.background,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffCBD5E1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffCBD5E1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      prefixIcon: SvgPicture.asset(
                        "assets/icons/search.svg",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                  elevation: 2,
                  position: PopupMenuPosition.over,
                  surfaceTintColor: Colors.white,
                  itemBuilder: (context) => List.generate(
                      viewModel.maintenances.length,
                      (index) => PopupMenuItem(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox.adaptive(
                                    value: false, onChanged: (_) {}),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                viewModel.maintenances[index].equipmentName ??
                                    "",
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ))),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xffCBD5E1))),
                    child: SvgPicture.asset("assets/icons/filter.svg"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Equipments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: viewModel.maintenances.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 32, color: Color(0xffCBD5E1));
                },
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                            "assets/images/equip_image_${viewModel.maintenances[index].imageUrl}.png"),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  viewModel.maintenances[index].equipmentName ??
                                      "",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: switch (
                                        viewModel.maintenances[index].status ??
                                            MaintenanceStatus.available) {
                                      MaintenanceStatus.maintenanceMode =>
                                        kcGreyTint.withOpacity(0.3),
                                      MaintenanceStatus.unavailable =>
                                        kcErrorTint,
                                      _ => kcSuccessTint,
                                    },
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    switch (
                                        viewModel.maintenances[index].status ??
                                            MaintenanceStatus.available) {
                                      MaintenanceStatus.maintenanceMode =>
                                        "Under maintenance",
                                      MaintenanceStatus.unavailable =>
                                        "Do not use",
                                      _ => "Available"
                                    },
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: switch (viewModel
                                                .maintenances[index].status ??
                                            MaintenanceStatus.available) {
                                          MaintenanceStatus.maintenanceMode =>
                                            kcTextColor3,
                                          MaintenanceStatus.unavailable =>
                                            kcError,
                                          _ => kcSuccess,
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.5),
                            Text(
                              viewModel.maintenances[index].categoryName ?? "",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffCBD5E1),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xffCBD5E1).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                "Last Maintenance: 17/05/24",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: kcTextColor3),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xffCBD5E1).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                "Next Maintenance: 05/10/24",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: kcTextColor3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  MaintenanceViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MaintenanceViewModel();
}

class SearchMaintenanceWidget extends StatefulWidget {
  const SearchMaintenanceWidget({super.key});

  @override
  State<SearchMaintenanceWidget> createState() =>
      _SearchMaintenanceWidgetState();
}

class _SearchMaintenanceWidgetState extends State<SearchMaintenanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
