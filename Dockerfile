FROM postgres:18

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    postgresql-server-dev-18 \
    make \
    gcc \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*

# 使用最新稳定版本 1.2（兼容 PostgreSQL 18）
RUN wget -O /tmp/pg_bigm-1.2.tar.gz https://github.com/pgbigm/pg_bigm/archive/refs/tags/v1.2-20250903.tar.gz \
    && cd /tmp \
    && tar xzf pg_bigm-1.2.tar.gz \
    && cd pg_bigm-1.2 \
    && make USE_PGXS=1 \
    && make USE_PGXS=1 install \
    && cd / \
    && rm -rf /tmp/pg_bigm-1.2*
