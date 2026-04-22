# Workspace

## Overview

pnpm workspace monorepo using TypeScript. Each package manages its own dependencies.

## Stack

- **Monorepo tool**: pnpm workspaces
- **Node.js version**: 24
- **Package manager**: pnpm
- **TypeScript version**: 5.9
- **API framework**: Express 5
- **Database**: PostgreSQL + Drizzle ORM
- **Validation**: Zod (`zod/v4`), `drizzle-zod`
- **API codegen**: Orval (from OpenAPI spec)
- **Build**: esbuild (CJS bundle)

## Key Commands

- `pnpm run typecheck` — full typecheck across all packages
- `pnpm run build` — typecheck + build all packages
- `pnpm --filter @workspace/api-spec run codegen` — regenerate API hooks and Zod schemas from OpenAPI spec
- `pnpm --filter @workspace/db run push` — push DB schema changes (dev only)
- `pnpm --filter @workspace/api-server run dev` — run API server locally

See the `pnpm-workspace` skill for workspace structure, TypeScript setup, and package details.

## Menu Card App

A restaurant digital menu card web app at `/`.

### Features
- **Guest Menu (/)**: Browse menu items by category, add to cart, place orders by table number
- **Admin Panel (/admin)**: Dashboard with stats, order management, menu item/category management

### DB Schema
- `categories` — menu categories with display order
- `menu_items` — dishes with name, description, price, categoryId, available flag
- `orders` — orders with JSONB items array, table number, status, total

### API Routes (mounted under /api)
- `GET/POST /categories`, `PUT/DELETE /categories/:id`
- `GET/POST /menu-items`, `GET/PUT/DELETE /menu-items/:id`
- `GET/POST /orders`, `GET/PUT /orders/:id`, `GET /orders/stats/summary`

### Frontend
- React + Vite, Wouter routing, Framer Motion animations
- Zustand for cart state
- Warm terracotta/amber design system
- Fonts: Plus Jakarta Sans + Fraunces
