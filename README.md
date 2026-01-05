# Linux Automation Lab

Projeto prático de automação em Linux utilizando **Bash Script**, **cron**, **logs**, **Git** e boas práticas de administração de sistemas.

## 🎯 Objetivo
Criar um conjunto de scripts para monitoramento e automação de tarefas administrativas, simulando rotinas reais de um ambiente Linux corporativo.

---

## 📂 Estrutura do Projeto



---

## ⚙️ Scripts

### 🔹 check_disk.sh
Verifica uso de disco e gera alerta caso ultrapasse o limite definido.

### 🔹 check_services.sh
Valida se serviços críticos estão ativos.

### 🔹 check_cpu_mem_load.sh
Monitora:
- Uso de CPU
- Uso de memória
- Load average

Gera logs automaticamente em caso de alerta.

### 🔹 master.sh
Script orquestrador que executa todos os checks.

---

## ⏰ Agendamento com Cron

Exemplo para rodar a cada 5 minutos:

```bash
*/5 * * * * /home/linux-lab/labs/linux-automation-lab/scripts/master.sh






















