#!/bin/bash

# Acessa a pasta do projeto
cd "$(dirname "$0")"

echo "🔄 1. Baixando atualizações do GitHub..."
# O --rebase evita que o script trave pedindo explicações
git pull origin master --rebase

echo "📂 2. Identificando novos arquivos e alterações..."
git add .

# Define uma mensagem automática com a data e hora do envio
MENSAGEM="Sincronização automática: $(date '+%Y-%m-%d %H:%M:%S')"

echo "💾 3. Salvando alterações localmente..."
git commit -m "$MENSAGEM"

echo "🚀 4. Enviando tudo para o GitHub..."
git push origin master

echo "✅ Sincronização concluída com sucesso!"
