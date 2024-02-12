import "package:flutter/material.dart";

//this is for ListView() and ListTile()
class ListViewOne extends StatelessWidget {
  const ListViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("ListView App"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: const [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.people_outlined),
              ),
              title: Text(
                "Subair ListView",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              subtitle: Text(
                "Flutter App Developer",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            )
          ])),
    );
  }
}

//this is for ListView.builder()
class ListViewTwo extends StatelessWidget {
  const ListViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      "Prakash",
      "Adhithya",
      "Jothika",
      "Nellai",
      "Subair",
      "Smily",
      "Solomon",
      "Abishek",
      "Siva",
      "Kabila",
      "Priya",
      "Antony",
      "Surya",
      "Kalla"
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("ListView.builder"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(items[index],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: const Text("Flutter Developer"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print("Item : ${items[index]}");
                },
              );
            },
          )),
    );
  }
}

//this is for ListView.seperated()
class ListViewThree extends StatelessWidget {
  const ListViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      "Prakash",
      "Adhithya",
      "Jothika",
      "Nellai",
      "Subair",
      "Smily",
      "Solomon",
      "Abishek",
      "Siva",
      "Kabila",
      "Priya",
      "Antony",
      "Surya",
      "Kalla"
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("ListView.seperated"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(color: Colors.black, height: 10),
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(items[index],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: const Text("Flutter Developer"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print("Item : ${items[index]}");
                },
              );
            },
          )),
    );
  }
}
