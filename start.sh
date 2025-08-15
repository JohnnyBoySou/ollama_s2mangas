#!/usr/bin/env sh
set -e
MODELS="${OLLAMA_MODELS:-qwen2.5:3b}"
mkdir -p /root/.ollama
ollama serve &
# espera API subir
for i in $(seq 1 60); do
  curl -sf http://127.0.0.1:11434/api/tags && break
  sleep 1
done
for M in $MODELS; do
  echo "Pulling $M ..."
  ollama pull "$M" || true
done
wait -n
