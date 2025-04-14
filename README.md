# Omama GUI

<p align="center">
  <img src="https://img.shields.io/github/v/release/ALAWIII/omama?label=Release&logo=github" alt="Release">
  <img src="https://img.shields.io/github/license/ALAWIII/omama?color=blue" alt="License">
  <img src="https://img.shields.io/github/issues/ALAWIII/omama?logo=github" alt="Issues">
  <img src="https://img.shields.io/github/stars/ALAWIII/omama?style=social" alt="Stars">
  <img src="https://img.shields.io/github/last-commit/ALAWIII/omama?logo=git" alt="Last Commit">
  <img src="https://img.shields.io/github/downloads/ALAWIII/omama/total?logo=github" alt="Downloads">
  <img src="https://img.shields.io/badge/flutter-stable-blue?logo=flutter" alt="Flutter">
  <img src="https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20windows-green?logo=desktop-dot-com" alt="Platform">
</p>

---

## ✨ Overview

**Omama GUI** is a sleek and modern graphical interface that helps you manage and interact with local Ollama models. Whether you're a developer or an AI enthusiast, Omama simplifies your workflow with a powerful general-purpose Retrieval-Augmented Generation (RAG) system — no deep technical knowledge required.

🔗 **Watch the Demo:** [Overview Video](https://drive.google.com/file/d/1op6VmV31YIgXQOquY2P5heADOBoffX8E/view?usp=sharing)

---

## 🚀 Features

- ⚙️ **Model Management**
  Browse, download, and manage Ollama models with ease using a beautiful, intuitive interface.

- 💬 **Chat Experience**
  Seamlessly chat with your favorite models in real time through a responsive, clean interface.

- 🧠 **General-Purpose RAG Integration**
  Responses are enhanced by an integrated RAG system that brings context-awareness and document-grounded answers.

- 🧩 **Modular Architecture**
  Built to work with [Omama Manager](https://github.com/ALAWIII/omama_manager), supporting:
  - Indexing
  - Retrieval
  - Query Orchestration
  - File or [SurrealDB](https://surrealdb.com) storage

- 🌙 **Offline-First**
  Omama works fully offline with locally run LLMs using [Ollama](https://ollama.com), ensuring data privacy.

---

## 🛠️ Getting Started

> ⚠️ **Note:** Full setup automation is in progress — follow these manual steps for now.

### 🔧 Requirements

- ✅ [Ollama](https://ollama.com/) installed and running in the background.
- ✅ [Omama GUI Release](https://github.com/ALAWIII/omama/releases) downloaded and extracted.
- ✅ [Omama CLI](https://github.com/ALAWIII/omama_cli/releases) downloaded and extracted into a folder named `omama_cli`, then placed **inside the Omama GUI directory**.

### ⚡ First Run Instructions

1. Open **Omama GUI**
2. Click on the **Models Store** icon.
3. Wait ~2 minutes while model data is cached from the web.
4. Close and reopen Omama GUI.
5. You're ready to chat and explore!

---

## 🧩 Related Projects

- [`omama-cli`](https://github.com/ALAWIII/omama_cli) – Command-line tool that bridges GUI with the backend.
- [`omama-manager`](https://github.com/ALAWIII/omama_manager) – Core backend for RAG, retrieval, orchestration, and model logic.
- [`ollama-models-info-fetcher`](https://github.com/ALAWIII/ollama_models_info_fetcher) – Library for fetching model metadata.
- [`ollama-td`](https://github.com/ALAWIII/ollama_td) – Utility for downloading Ollama clients *(not used in production due to issues)*.

---

## 📚 References & Inspiration

The RAG engine in Omama GUI is inspired by cutting-edge research:
- 📘 [Rag book](https://alawiii.github.io/Rag-book/) - quick book guide.
- 📖 [RAG Survey (2023)](https://arxiv.org/abs/2312.10997) – Overview of RAG methods and design choices.
- 🧱 [Modular RAG (2024)](https://arxiv.org/abs/2407.21059) – Best practices for building modular RAG systems.
- 🧠 [RAG Best Practices (2024)](https://arxiv.org/abs/2407.01219) – Techniques for scalable and robust RAG architectures.

---

## 🙌 Contributing

Contributions, feature ideas, and feedback are welcome!
Feel free to open issues or pull requests if you'd like to help improve Omama GUI.

---

## 📄 License

This project is licensed under the **MIT License**.
See the [LICENSE](https://github.com/ALAWIII/omama/blob/main/LICENSE) file for more details.

---
