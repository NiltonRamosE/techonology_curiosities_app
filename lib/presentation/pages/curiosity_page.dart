import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/curiosity_provider.dart';
import '../widgets/curiosity_card.dart';

class CuriosityPage extends StatelessWidget {
  const CuriosityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CuriosityProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Curiosities'),
        actions: [
          // Botón de refresh manual
          IconButton(
            onPressed: provider.loadCuriosities,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: provider.isLoading && provider.items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              // Pull to refresh
              onRefresh: () => provider.loadCuriosities(),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: provider.items.length,
                itemBuilder: (_, i) => CuriosityCard(
                  curiosity: provider.items[i],
                ),
              ),
            ),
    );
  }
}