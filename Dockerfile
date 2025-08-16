FROM ollama/ollama:latest

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# expõe direto a 8080
EXPOSE 8080

# Ollama escuta na porta 8080
ENV OLLAMA_MODELS="qwen2.5:3b" \
    OLLAMA_HOST=0.0.0.0:8080

ENTRYPOINT ["/usr/local/bin/start.sh"]
