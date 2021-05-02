function proxyon
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
end

function proxyoff
    unset http_proxy
    unset https_proxy
end

function condaon
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
    eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
end
