import 'package:flutter/material.dart';

extension FutureExtensions<T> on Future<T> {
  Widget when({
    required Widget Function() loading,
    required Widget Function(T? data) data,
    required Widget Function(Object error) error,
  }) {
    return FutureBuilder<T>(
      future: this,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading();
        }
        if (snapshot.hasError) {
          return error(snapshot.error!);
        }
        return data(snapshot.data);
      },
    );
  }
}