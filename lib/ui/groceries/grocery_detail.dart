import 'package:flutter/material.dart';
import 'tab/grocery_search.dart';
import 'tab/grocery_list.dart';

class GroceryDetail extends StatefulWidget {
  const GroceryDetail({super.key, required this.groceryId});

  final String groceryId;

  @override
  State<GroceryDetail> createState() => _GroceryDetailState();
}


enum GroceryTab {allGroceries, filterGroceries}

class _GroceryDetailState extends State<GroceryDetail>{
  GroceryTab _currentTab = GroceryTab.allGroceries;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          GroceryList(groceryId: widget.groceryId),
          GrocerySearch(groceryId: widget.groceryId),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: Colors.blue,
        onTap: (index){
          setState(() {
            _currentTab = GroceryTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Groceries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
