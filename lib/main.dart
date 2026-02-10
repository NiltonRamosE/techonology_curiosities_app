import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/services/curiosity_api_service.dart';
import 'data/repositories/curiosity_repository_impl.dart';
import 'domain/services/get_curiosities.dart';
import 'presentation/providers/curiosity_provider.dart';
import 'presentation/pages/curiosity_page.dart';

void main() {
  runApp(const CuriosityApp());
}

class CuriosityApp extends StatelessWidget {
  const CuriosityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CuriosityProvider(
        GetCuriosities(
          CuriosityRepositoryImpl(
            CuriosityApiService(),
          ),
        ),
      )..loadCuriosities(),
      child: const MaterialApp(
        home: CuriosityPage(),
      ),
    );
  }
}