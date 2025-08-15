FROM ollama/ollama:latest
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 11434
ENV OLLAMA_MODELS="qwen2.5:3b" OLLAMA_HOST=0.0.0.0
CMD ["/start.sh"]
