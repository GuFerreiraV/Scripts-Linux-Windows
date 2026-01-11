## Comandos essenciais

- Lembre-se de delegar permissões para o seu script com `chmod`
  ```shell
  chmod +x ~/Scripts/Scripts-No-Linux/clean_downloads.sh
  ```


- Para scripts rotineiros, configure o crontab, que é o utilitário padrão no Linux para agendar tarefas recorrentes.
  ```shell
  crontab -e

  0 3 * * 0 /home/SEU_USUARIO/Scripts/Scripts-No-Linux/clean_downloads.sh >/dev/null 2>&1
  ```
  0 - Minuto.
  3 - 3ª hora do dia (3 AM).
  * - Qualquer dia do mês.
  * - Qualquer mês
  * - Domingo
  Scripts/Scripts-No-Linux/clean_downloads  - O comando ou script a ser executado.
  >/dev/null 2>&1 - Redireciona a saída padrão (stdout) e a de erro (stderr) para o nada

## Scritps Futuros 
- Monitoramento de processos: Script para monitorar o uso cpu e ram além do comum e disparar uma mensagem para o usuário alertando-o e indicando software está consumindo mais que o necessário.
