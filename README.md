Create a Docker Compose with the following setup:

- A container "web" based on image reg.lecroq.it/apache. Make sure the container is called "web".
- A container "db" based on postgres:alpine. Make sure the container is called "db".
- Both containers should have the following variables defined:
  - POSTGRES_HOST=mydb
  - POSTGRES_DB=mydb
  - POSTGRES_USER=myuser
  - POSTGRES_PASSWORD=mypasswd
- The "web" container should have port forwarding set up for port 80.
- Create a network "mynetwork" to make both containers communicate with each other.
- Create a volume "web_volume" that hosts /var/www/html on the "web" container.
- Create a volume "db_volume" that hosts /var/lib/postgres/data on the "db" container.
- Make sure the container "web" can reach the container "db" at the hostname "mydb" (links).
  When all of this is configured, launch the compose and browse to the web site. Create an admin user and see how the setup completes successfully.

```sh
version: '3'

services:
  web:
    image: reg.lecroq.it/apache
    container_name: web
    environment:
      - POSTGRES_HOST=mydb
      - POSTGRES_PASSWORD=mypasswd
      - POSTGRES_DB=mydb
      - POSTGRES_USER=myuser
    ports:
      - 80:80
    volumes:
      - web_volume:/var/www/html
    networks:
      - mynetwork
    links:
      - db:mydb
  db:
    image: postgres:alpine
    container_name: mydb
    environment:
      - POSTGRES_PASSWORD=mypasswd
      - POSTGRES_DB=mydb
      - POSTGRES_USER=myuser
    volumes:
      - db_volume:/var/lib/postgresql/data
    networks:
      - mynetwork
    expose:
      - 5432
volumes:
  web_volume:
  db_volume:
networks:
  mynetwork:
```
