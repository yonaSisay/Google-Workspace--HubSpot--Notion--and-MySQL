## Getting Started with n8n and MySQL using Docker Compose

This guide will help you set up n8n and MySQL using Docker Compose. Follow the steps below to ensure a smooth setup.

---

### 1. Verify Your `docker-compose.yml`
Open your `docker-compose.yml` file and ensure all required environment variables for MySQL and n8n are correctly defined.

---

### 2. Run Docker Compose
Start the containers using the following command:

```bash
docker-compose up
```

If you want to force a clean start, stop and remove existing containers first:

```bash
docker-compose down -v
docker-compose up --build
```

---

### 3. Log in to n8n
1. Access the n8n dashboard in your browser.
2. Log in using your n8n username and password.

---

### 4. Import the Workflow
1. Click **"Import"** at the top of the n8n dashboard.
2. Select the provided `Workflow.json` file.
3. Click **"Execute Workflow"** to test.

---

### 5. Set Up MySQL Connection in n8n
1. In the **MySQL Node**, click **"Edit"**.
2. Enter the following details:
   - **Host**: `mysql`
   - **Port**: `3306`
   - **Database**: `mydatabase`
   - **User**: `myuser`
   - **Password**: `mypassword`
3. Click **"Save"** and test the connection.
