# Gebruik een lichtgewicht Nginx image als basis
FROM nginx:alpine

# Verwijder de standaard Nginx index pagina
RUN rm -rf /usr/share/nginx/html/*

# Kopieer de custom Nginx configuratie
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Kopieer de webapplicatie naar de container
# Zorg dat je 'devtools_suite.html' hernoemt naar 'index.html' 
# of pas de naam hieronder aan.
COPY index.html /usr/share/nginx/html/index.html

# Expose poort 80 voor webverkeer
EXPOSE 80

# Start Nginx op de voorgrond
CMD ["nginx", "-g", "daemon off;"]
