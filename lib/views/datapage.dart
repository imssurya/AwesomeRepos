import 'package:AwesomeRepos/model/gihub_data_model.dart';
import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  final List<Items> githubData;
  DataPage({Key key, this.githubData}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(),
            Text(
              '${widget.githubData.elementAt(index + 1).owner.login[0].toUpperCase()}${widget.githubData.elementAt(index + 1).owner.login.substring(1)}' ??
                  '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        );
      },
      itemCount: widget.githubData.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${widget.githubData.elementAt(index).owner.login[0].toUpperCase()}${widget.githubData.elementAt(index).owner.login.substring(1)}' ??
                    '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              ListTile(
                title: Text(
                  widget.githubData.elementAt(index).name ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle:
                    Text(widget.githubData.elementAt(index).description) ?? '',
                leading: Container(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            widget.githubData.elementAt(index).owner.avatarUrl),
                      ),
                    ],
                  ),
                ),
                trailing: Text(
                  widget.githubData
                          .elementAt(index)
                          .stargazersCount
                          .toString() ??
                      '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
        }
        return ListTile(
          title: Text(widget.githubData.elementAt(index).name ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text(widget.githubData.elementAt(index).description ?? ''),
          leading: Container(
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      widget.githubData.elementAt(index).owner.avatarUrl),
                ),
              ],
            ),
          ),
          trailing: Text(
            widget.githubData.elementAt(index).stargazersCount.toString() ?? '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
