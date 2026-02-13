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


## Explicação menu_arch
- Eu sempre esqueço os comandos para configurar, instalar e atualizar pacotes no arch linux, ai criei este programa simples para isso. Vou adicionar mais comandos futuramente.
- Salva o script em um lugar específico -> ~/bin/
- Dê permissão para o script -> chmod +x ~/bin/menu-arch
- O /bin/ precisa estar no PATH | Adicione no `~/.bashrc`
  - export PATH="$HOME/bin:$PATH"
