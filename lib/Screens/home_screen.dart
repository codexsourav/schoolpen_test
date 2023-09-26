import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  late ScrollController _scrollController;
  bool _showIcon = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Add a scroll listener to the ScrollController to show/hide the icon.
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _showIcon = true;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showIcon = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Appbar"),
        actions: [
          AnimatedOpacity(
            opacity: _showIcon ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Perform your action here
              },
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController, // Assign the ScrollController here
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Scroll Up to Show Icon"),
              background: Image.network(
                "https://via.placeholder.com/500x200",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text("Item $index"),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
