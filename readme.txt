k8s debug pod(netshoot+java21+groovy5)

kubectl run netshoot --image=ghcr.io/udagawa/netshoot-java-groovy:latest
kubectl exec -it netshoot -- bash
