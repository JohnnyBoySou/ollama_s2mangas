#!/usr/bin/env sh
set -e

MODELS="${OLLAMA_MODELS:-qwen2.5:3b}"

# sobe o servidor em background
ollama serve &

# espera a API ficar disponível
i=0
until curl -sf http://127.0.0.1:11434/api/tags >/dev/null 2>&1; do
  i=$((i+1))
  [ $i -gt 60 ] && { echo "Ollama não subiu em 60s"; exit 1; }
  sleep 1
done

# puxa os modelos desejados (não derruba se falhar)
for M in $MODELS; do
  echo "Pulling $M ..."
  ollama pull "$M" || true
done

# mantém o processo principal vivo
wait -n
