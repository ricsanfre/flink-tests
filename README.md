
## Installing Flink Operartor

Flink-operator 1.9 needs cert-manager as a pre-requisite. flink-operator webhook creates a Certificate resource.

- Step 0. Install cert-manager

  ```shell
  ## Add cert-manager repo
  helm repo add jetstack https://charts.jetstack.io
  ## Update repos
  helm repo update
  # Install helm chart
  helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set crds.enable=true
  ```

  And a cluster issuer need to be configured:

  ```shell
  kubectl apply -f cluster-cert-issuer.yml
  ```

- Step 1. Chek latest stable version from https://flink.apache.org/downloads/

- Step 2. Add helm repo

  ```shell
  helm repo add flink-operator-repo https://downloads.apache.org/flink/flink-kubernetes-operator-<OPERATOR-VERSION>/
  ```

- Step 3. Install flink operator

  ```shell
  helm install flink-kubernetes-operator flink-operator-repo/flink-kubernetes-operator

  ```
- Step 4. Create flink cluster

  ```shell
  kubectl create -f https://raw.githubusercontent.com/apache/flink-kubernetes-operator/release-1.9/examples/basic.yaml
  ```


## References

- Apache Flink Kubernetes Operator
   - [Flink Operator doc](https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-main/)
   - [Flink Operator repo](https://github.com/apache/flink-kubernetes-operator)
   - [Unocking the power of flink with kubernetes operator](https://diogodssantos.medium.com/unlocking-the-power-of-flink-with-kubernetes-operator-simplify-data-management-for-daas-cf0fe0c1485b)


- Flink Training courses
   - [Fundamentals of Apache Flink](https://developer.confluent.io/courses/apache-flink/intro/)
   - [Building Apache Flink Applications in Java](https://developer.confluent.io/courses/flink-java/overview/)