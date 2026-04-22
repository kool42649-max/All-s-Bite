# Development with Docker

This repository includes a Dockerfile and docker-compose.yml to run the `menu-card` app inside a Linux container so you can develop reliably on Windows.

Quick start

1. Build and run (development, with live reload):

```bash
docker compose up --build
```

2. Open the app in your browser:

http://localhost:5173

Notes

- The compose service mounts the repository into the container so edits on the host are reflected inside the container.
- The container runs `pnpm` and the workspace dev server for `@workspace/menu-card`.
- If dependencies change, rebuild the image:

```bash
docker compose up --build
```

Troubleshooting

- If you see native binary errors (esbuild, rollup native package), rebuild the image and ensure your Docker host has network access to npm registries.
- To test the site locally using your domain `allsbite.com`, add an entry to your hosts file pointing that domain to `127.0.0.1` while the dev server is running:

  - Windows (Admin): edit `C:\Windows\System32\drivers\etc\hosts` and add:

    ```text
    127.0.0.1 allsbite.com
    ```

  - Then open: https://allsbite.com:5173 or http://allsbite.com:5173 (Vite dev server is HTTP by default).

- For production deployment, build the app (`pnpm --filter @workspace/menu-card build`) and serve the static files using your preferred webserver (nginx, Docker image, or a hosting provider).

If you want, I can also:

- Add a small README at the project root named `README.md` (shorter).
- Create a production Dockerfile that builds and serves static assets via `nginx`.
