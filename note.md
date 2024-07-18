## SFT

- Breeze-7B-Base: 不適合SFT
- Breeze-7B-Instruct: 效果比較符合預期

## 啟動 Hi5 LLM API
- 先切換到 main branch, docker compose up -d
- 再切回 local_dev branch, docker exec -it llama-factory bash
- llamafactory-cli api examples/inference/commandr01.yaml
