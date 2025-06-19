<?php
$phpVersion = phpversion();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexoHost | Web Server Active</title>
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
            position: relative;
        }

        .lang-switch {
            position: absolute;
            top: 15px;
            right: 20px;
        }

        .lang-switch button {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 6px 10px;
            margin-left: 5px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.8rem;
        }

        .lang-switch button:hover {
            background: #0072d6;
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

<div class="lang-switch">
    <button onclick="setLang('en')">EN</button>
    <button onclick="setLang('es')">ES</button>
</div>

<div class="card">
    <h1 id="title">🚀 Web Server Running</h1>
    <p id="version-label">Current PHP Version:</p>
    <div class="php-version">PHP <?php echo $phpVersion; ?></div>
    <div class="message" id="message">✅ Everything is configured correctly.</div>
    <div class="webroot-message" id="webroot-msg">📂 Place your website files inside the <strong>webroot</strong> folder</div>
    <div class="footer" id="footer">
        <p>Powered by <a href="https://nexohost.es" target="_blank">NexoHost.es</a></p>
    </div>
</div>

<script>
    const texts = {
        es: {
            title: "🚀 Servidor Web en Marcha",
            versionLabel: "Versión PHP actual:",
            message: "✅ Todo se ha configurado correctamente.",
            webrootMsg: "📂 Coloca los archivos de tu web en la carpeta <strong>webroot</strong>",
            footer: 'Potenciado por <a href="https://nexohost.es" target="_blank">NexoHost.es</a>'
        },
        en: {
            title: "🚀 Web Server Running",
            versionLabel: "Current PHP Version:",
            message: "✅ Everything is configured correctly.",
            webrootMsg: "📂 Place your website files inside the <strong>webroot</strong> folder",
            footer: 'Powered by <a href="https://nexohost.es" target="_blank">NexoHost.es</a>'
        }
    };

    function setLang(lang) {
        document.getElementById("title").innerText = texts[lang].title;
        document.getElementById("version-label").innerText = texts[lang].versionLabel;
        document.getElementById("message").innerText = texts[lang].message;
        document.getElementById("webroot-msg").innerHTML = texts[lang].webrootMsg;
        document.getElementById("footer").innerHTML = `<p>${texts[lang].footer}</p>`;
    }

    // Default to English on load
    window.onload = () => setLang('en');
</script>

</body>
</html>
