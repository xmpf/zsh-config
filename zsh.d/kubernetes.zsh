alias k=kubectl
alias kg='kubectl get'
alias kd='kubectl describe'
alias kctx='kubectl config use-context'

complete -o default -F __start_kubectl k

function kdocs {
	xdg-open "https://kubernetes.io/search/?q=$@"
}
