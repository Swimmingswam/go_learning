#!/bin/bash

set -x

function compile()
{
    cd ..
    rm -rf go.mod
    rm -rf go.sum
    go mod init github.com/Swimmingswam/go_learning
    go mod tidy
    make clean && make all
}

function deploy()
{
	compile
    docker build -t {repo}:{tag} .
    docker push {repo}:{tag}
    kubectl -f ./deployments/configmap.yaml
    kubectl -f ./deployments/deployment.yaml
    kubectl -f ./deployments/service.yaml
}

main()
{
	case $1 in
	compile)
		compile
		;;
	deploy)
		deploy
		;;
	*)
		echo "error:argument is invalid"
		;;
	esac
}

main "$@"