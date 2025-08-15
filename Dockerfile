FROM ollama/ollama:latest

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 11434
ENV OLLAMA_MODELS="qwen2.5:3b" \
    OLLAMA_HOST=0.0.0.0:11434

# substitui o ENTRYPOINT default ("ollama") pelo script
ENTRYPOINT ["/usr/local/bin/start.sh"]
