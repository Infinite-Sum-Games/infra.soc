# Infra Configs for Season of Code

This repository contains a couple of experimental configurations 
which are tested and used in the final deployment but also configs 
that were just used during various experimentations.

1. Metabase (using it as a UI layer for production database)
2. Prometheus and Grafana (observability and monitoring stack)
3. Nginx/Caddy config (reverse proxy)
4. Systemd files for (linux auto-restart scripts)
    a. pulse (API server)
    b. alfred (webhook manager)
    c. devpool (github bot)
    d. gravemind (badge and stat computer)
    e. redis-server
    f. postgres
5. Database backup scripts
6. Redis snapshot setup
7. ClickHouse experiments (data warehouse)
8. Vector experiments (ultra-fast log-shipper)
10. Coolify experiments (self-hosted vercel)

## Authors

This repository is put together by [Ritesh Koushik](https://github.com/IAmRiteshKoushik)
