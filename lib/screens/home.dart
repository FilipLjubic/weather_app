import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: FloatAppBar(),
      body: Stack(
        children: [
          // image container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/zagreb.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.7,
            minChildSize: 0.2,
            initialChildSize: 0.3,
            builder: (context, scrollController) => Container(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                  title: Text("Item $index"),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Color(0x99D2F6FF),
          child: ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.grey,
            ),
            title: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
