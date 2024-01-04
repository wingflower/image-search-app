import 'package:flutter/material.dart';
import 'package:image_search_app_ver1/data/model/image_item.dart';
import 'package:image_search_app_ver1/view/main_view_model.dart';

import 'widget/image_item_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();

  NumOfImages? numOfImages;

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  DropdownMenu<NumOfImages>(
                    initialSelection: NumOfImages.three,
                    requestFocusOnTap: true,
                    width: 80,
                    label: const Text('N'),
                    onSelected: (NumOfImages? num) {
                      setState(() {
                        numOfImages = num ?? NumOfImages.three;
                      });
                    },
                    dropdownMenuEntries: NumOfImages.values
                        .map<DropdownMenuEntry<NumOfImages>>((NumOfImages num) {
                      return DropdownMenuEntry<NumOfImages>(
                        value: num,
                        label: num.numOfImages.toString(),
                      );
                    }).toList(),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchTextEditingController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xFF4FB6B2),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xFF4FB6B2),
                          ),
                        ),
                        hintText: 'Search',
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Color(0xFF4FB6B2),
                          ),
                          onPressed: () async {
                            await viewModel.searchImage(
                                searchTextEditingController.text,
                                (numOfImages?.numOfImages ??
                                    NumOfImages.three.numOfImages));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                        itemCount: state.imageItems.length,
                        itemBuilder: (context, index) {
                          final imageItem = state.imageItems[index];
                          return ImageItemWidget(imageItem: imageItem);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
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
