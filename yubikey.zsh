if [[ -z $SSH_CONNECTION || $SSH_AUTH_SOCK == "*launchd*" ]] && [[ -z $SUDO_COMMAND ]]; then

  SSH_ENV="$HOME/.ssh/env"

  function start_agent {
      echo "Initializing new SSH agent..."
      /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
      echo succeeded
      chmod 600 "${SSH_ENV}"
      . "${SSH_ENV}" > /dev/null

      ln -sf $SSH_AUTH_SOCK ~/.ssh/auth.sock
      export SSH_AUTH_SOCK=$HOME/.ssh/auth.sock

      /usr/bin/ssh-add -s /usr/local/lib/opensc-pkcs11.so;
  }

  if [ -f "${SSH_ENV}" ]; then
      . "${SSH_ENV}" > /dev/null

      ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
          start_agent;
      }
  else
      start_agent;
  fi

  function ykreset {
      /usr/bin/ssh-add -e /usr/local/lib/opensc-pkcs11.so;
      /usr/bin/ssh-add -s /usr/local/lib/opensc-pkcs11.so;
  }

fi
