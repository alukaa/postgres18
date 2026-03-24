FROM postgres:18

# 安装依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    postgresql-server-dev-18

# 下载并编译 pg_bigm
RUN git clone https://github.com/pgbigm/pg_bigm.git /tmp/pg_bigm \
    && cd /tmp/pg_bigm \
    && make \
    && make install

# 清理
RUN rm -rf /tmp/pg_bigm
