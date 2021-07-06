import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Function buildErrorDialog(Exception exception) {
  return (BuildContext context) {
    return AlertDialog(
      title: Text('Что-то пошло не так...'),
      content: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Icon(
              CupertinoIcons.clear_circled,
              color: Colors.red,
              size: 64,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(exception.toString()),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Закрыть'),
        ),
      ],
    );
  };
}

Function buildCheckInternetDialog() {
  return (BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Нет интернета')),
      content: Container(
        child: Icon(
          CupertinoIcons.wifi_slash,
          size: 64,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Закрыть'))
      ],
    );
  };
}

Function buildSuccessDialog(String title) {
  return (BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Icon(
        CupertinoIcons.check_mark_circled,
        color: Colors.green,
        size: 64,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Закрыть'))
      ],
    );
  };
}

Function buildDeleteDialog() {
  return (BuildContext context) {
    return AlertDialog(
      title: Text('Внимание!'),
      content: Text('Вы действительно хотите удалить?'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Нет')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Да'))
      ],
    );
  };
}
