# Utiliser l'image officielle de nginx
FROM nginx:latest

# Copier custom index.html vers le dossier Nginx
COPY index.html /usr/share/nginx/html/
