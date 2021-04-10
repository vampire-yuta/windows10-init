
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

function fish_prompt
  echo -n (set_color cyan)(prompt_pwd) (set_color green)'❯'
 
  # Git
  set last_status $status
  printf '%s ' (__fish_git_prompt)
  set_color normal
end

set fish_theme agnoster

# Terraform
export PATH="$HOME/.tfenv/bin:$PATH"
alias tf="terraform"
alias tfp="terraform plan"
alias tfv="terraform validate"
alias tff="terraform fmt -recursive"
azure --completion-fish | source
