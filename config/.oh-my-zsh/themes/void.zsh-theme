autoload -Uz colors && colors
autoload -Uz vcs_info
setopt prompt_subst

# set up exit_code
typeset -g void_exit_code
precmd_void_exit_code() { if (( $? == 0 )); then void_exit_code="green"; else void_exit_code="red"; fi }

# handle vcs_info
precmd_vcs_info() { vcs_info  }
precmd_functions+=( precmd_vcs_info precmd_void_exit_code  )

export PS1='%{$fg[$void_exit_code]%} λ %{$reset_color%}  '
export RPROMPT='%{$fg[green]%}$(basename $PWD)$vcs_info_msg_0_%{$reset_color%}'

# show git branch name
zstyle ':vcs_info:*:*' formats ' · %b'
