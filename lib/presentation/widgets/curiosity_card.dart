import 'package:flutter/material.dart';
import '../../domain/entities/curiosity.dart';
import '../pages/curiosity_detail_page.dart';
class CuriosityCard extends StatelessWidget {
  final Curiosity curiosity;

  const CuriosityCard({super.key, required this.curiosity});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Agrega margin para mejor visualización
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // Agrega elevation para efecto de profundidad
      elevation: 2,
      child: InkWell(
        // Este es el gesto de tap
        onTap: () {
          // Navegar a la página de detalles
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CuriosityDetailPage(
                curiosity: curiosity,
              ),
            ),
          );
        },
        // Efecto visual al tocar
        splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Emoji más grande
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  curiosity.emoji,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              const SizedBox(width: 16),
              // Contenido de texto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      curiosity.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      curiosity.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Información adicional pequeña
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        if (curiosity.methods > 0)
                          _buildInfoChip('${curiosity.methods} métodos'),
                        if (curiosity.popularity > 0)
                          _buildInfoChip('${curiosity.popularity} popular'),
                        if (curiosity.health > 0)
                          _buildInfoChip('${curiosity.health}% salud'),
                      ],
                    ),
                  ],
                ),
              ),
              // Ícono de flecha para indicar que es clicable
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).disabledColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}