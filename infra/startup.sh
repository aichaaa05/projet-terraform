```bash
#!/bin/bash

apt-get update
apt-get install -y nginx

VM_NAME=$(hostname)

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Terraform Web Server</title>
</head>
<body>
    <h1>Serveur : ${VM_NAME}</h1>
</body>
</html>
EOF

systemctl enable nginx
systemctl start nginx
```
