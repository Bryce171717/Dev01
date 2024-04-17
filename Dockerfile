# Utilisez l'image de base php:8.0.2-apache
FROM php:8.0.2-apache

# Mettez à jour les paquets et installez wget (utilisé pour télécharger Prometheus)
RUN apt-get update && apt-get install -y wget

# Téléchargez et extrayez Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.35.0/prometheus-2.35.0.linux-amd64.tar.gz && \
    tar -xvf prometheus-2.35.0.linux-amd64.tar.gz && \
    mv prometheus-2.35.0.linux-amd64 /usr/local/prometheus

# Copiez le fichier de configuration Prometheus dans le conteneur
COPY prometheus.yml /usr/local/prometheus/

# Exposez le port 9090 pour Prometheus
EXPOSE 9090

# Démarrez Apache et Prometheus au démarrage du conteneur
CMD ["apache2ctl", "-D", "FOREGROUND"] && ["/usr/local/prometheus/prometheus", "--config.file=/usr/local/prometheus/prometheus.yml"]

