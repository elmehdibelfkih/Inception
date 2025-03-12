# Inception Project

## Introduction
Inception is a project from 42 school that involves setting up a system of Docker containers to simulate a small-scale server environment. The goal is to understand containerization, orchestration, and service management while ensuring proper security and scalability.

## Features
- Uses Docker and Docker Compose for container management
- Multi-container setup (Nginx, WordPress, MariaDB, Redis, etc.)
- Secure communication using SSL/TLS
- Persistent data storage using volumes
- Reverse proxy configuration with Nginx
- Automated service management
- Network isolation for security

## Installation
### Prerequisites
- A Unix-based system (Linux/macOS recommended)
- Docker installed
- Docker Compose installed
- Make (optional for automation scripts)

### Steps to Install
1. Clone the repository:
   ```sh
   git clone https://github.com/elmehdibelfkih/inception.git
   cd inception
   ```
2. Build and run the project:
   ```sh
   docker-compose up --build -d
   ```
3. Check running containers:
   ```sh
   docker ps
   ```
4. Access the services:
   - Open a browser and navigate to `https://localhost` to access WordPress.
   - Use `docker logs <container_name>` to check logs.
   - Use `docker exec -it <container_name> sh` to access a container shell.

## Services Overview
- **Nginx**: Acts as a reverse proxy and handles SSL termination.
- **WordPress**: A content management system (CMS) for managing websites.
- **MariaDB**: A relational database for storing WordPress data.
- **Redis (Optional)**: Used for caching to improve performance.

## Configuration
Modify the `.env` file to customize:
```ini
DOMAIN_NAME=yourdomain.com
MYSQL_ROOT_PASSWORD=yourpassword
WORDPRESS_DB_USER=wpuser
WORDPRESS_DB_PASSWORD=wppassword
```

## Useful Commands
- Stop all containers:
  ```sh
  docker-compose down
  ```
- Restart services:
  ```sh
  docker-compose up -d
  ```
- Remove all Docker resources (use with caution):
  ```sh
  docker system prune -a
  ```

## Contributing
Pull requests are welcome. Ensure to follow best practices and provide documentation for any changes.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Authors
- Your Name (@elmehdibelfkih)

