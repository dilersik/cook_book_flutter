import 'package:cook_book_flutter/models/settings.dart';
import 'package:cook_book_flutter/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      drawer: MainDrawer(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text('Adjust your meal selection.', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _createSwitchListTile('Gluten-free', 'Only include gluten-free meals.', settings.isGlutenFree, (value) {
                  setState(() {
                    settings.isGlutenFree = value;
                  });
                }),
                _createSwitchListTile('Lactose-free', 'Only include lactose-free meals.', settings.isLactoseFree, (
                  value,
                ) {
                  setState(() {
                    settings.isLactoseFree = value;
                  });
                }),
                _createSwitchListTile('Vegetarian', 'Only include vegetarian meals.', settings.isVegetarian, (value) {
                  setState(() {
                    settings.isVegetarian = value;
                  });
                }),
                _createSwitchListTile('Vegan', 'Only include vegan meals.', settings.isVegan, (value) {
                  setState(() {
                    settings.isVegan = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createSwitchListTile(String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(title: Text(title), subtitle: Text(subtitle), value: value, onChanged: onChanged);
  }
}
