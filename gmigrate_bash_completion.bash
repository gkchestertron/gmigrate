_gmigrate () {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD - 1]}"

  if [ "$prev" = "add" ]; then
    opts="$(ls gschemas)"
  else
    opts="add run init"
  fi
  COMPREPLY=($(compgen -W "${opts}" ${cur}))
  return 0
}

complete -F _gmigrate gmigrate
