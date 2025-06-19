<?php
// Get the PHP version
$phpVersion = phpversion();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexoHost | Servidor Web Activo</title>
    <style>
        :root {
            --primary-color: #1e90ff;
            --secondary-color: #0c0f14;
            --accent-color: #28a745;
            --text-color: #f0f0f0;
            --bg-color: #121212;
            --card-color: #1f1f1f;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: var(--bg-color);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .card {
            background-color: var(--card-color);
            border-radius: 15px;
            padding: 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .card h1 {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .php-version {
            background: var(--primary-color);
            color: white;
            padding: 12px 20px;
            border-radius: 10px;
            font-size: 1.4rem;
            margin: 20px 0;
        }

        .message {
            color: var(--accent-color);
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        .webroot-message {
            color: #f39c12;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .footer {
            color: #999;
            font-size: 0.95rem;
        }

        .footer a {
            color: var(--primary-color);
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="card">
    <h1>🚀 Servidor Web en Marcha</h1>
    <p>Versión PHP actual:</p>
    <div class="php-version">PHP <?php echo $phpVersion; ?></div>
    <div class="message">✅ Todo se ha configurado correctamente.</div>
    <div class="webroot-message">📂 Coloca los archivos de tu web en la carpeta <strong>webroot</strong></div>
    <div class="footer">
        <p>Potenciado por <a href="https://nexohost.es" target="_blank">NexoHost.es</a></p>
    </div>
</div>

</body>
</html>
