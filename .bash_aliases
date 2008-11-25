alias lss='ls -lShr'
alias lse='ls -ltra'
alias dus='du -shm * | sort -g'
alias xterm='xterm -bg black -fg grey +cm +dc -geometry 80x25+100+50'

function ListenPort( ) { while true; do nc -l -p $1 -v; echo "respawn in 1 second"; sleep 1; echo; done }
