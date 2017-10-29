[ -n "$PS1" ] && source ~/.bash_profile

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/scott/opt/conda/envs/serverless/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/scott/opt/conda/envs/serverless/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/scott/opt/conda/envs/serverless/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/scott/opt/conda/envs/serverless/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash