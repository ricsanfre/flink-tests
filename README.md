
## Installing Flink Operartor



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



## References

- Apache Flink Kubernetes Operator
   - [Flink Operator doc](https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-main/)
   - [Flink Operator repo](https://github.com/apache/flink-kubernetes-operator)
  
- Training courses
   - [Fundamentals of Apache Flink](https://developer.confluent.io/courses/apache-flink/intro/)
   - [Building Apache Flink Applications in Java](https://developer.confluent.io/courses/flink-java/overview/)