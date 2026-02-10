import 'package:flutter/material.dart';
import '../../../domain/entities/curiosity.dart';

class CuriosityDetailPage extends StatelessWidget {
  final Curiosity curiosity;

  const CuriosityDetailPage({
    super.key,
    required this.curiosity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(curiosity.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emoji y título
            Row(
              children: [
                Text(
                  curiosity.emoji,
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    curiosity.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Descripción
            Text(
              curiosity.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            
            // Métricas en tarjetas
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildMetricCard(
                  context,
                  '📊 Métodos',
                  curiosity.methods.toString(),
                  Colors.blue,
                ),
                _buildMetricCard(
                  context,
                  '❤️ Salud',
                  '${curiosity.health}%',
                  Colors.green,
                ),
                _buildMetricCard(
                  context,
                  '📈 Popularidad',
                  curiosity.popularity.toString(),
                  Colors.orange,
                ),
                _buildMetricCard(
                  context,
                  '🎯 Confiabilidad',
                  '${curiosity.avgReliability.toStringAsFixed(1)}%',
                  Colors.purple,
                ),
                _buildMetricCard(
                  context,
                  '⚡ Latencia',
                  '${curiosity.avgLatency}ms',
                  Colors.red,
                ),
                _buildMetricCard(
                  context,
                  '📉 Error',
                  '${curiosity.avgError.toStringAsFixed(1)}%',
                  Colors.amber,
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Documentación
            if (curiosity.documentation.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Documentación:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      // Aquí podrías abrir el enlace en un navegador
                    },
                    child: Text(
                      curiosity.documentation,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            
            // Fuente
            if (curiosity.source.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fuente:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(curiosity.source),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}