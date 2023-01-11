endpoint="$(minikube service describe webserver-canary-svc --url)"

make_traffic() {
    for i in $(seq 1 "$1") ; do
        curl -s "$endpoint" ;
        sleep 0.01;
    done
}

make_traffic $1 | sort | uniq -c

# one-liner
# seq 10 | xargs -Iz curl -s "$(minikube service describe webserver-canary-svc --url)" | sort | uniq -c