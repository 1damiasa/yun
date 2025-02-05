provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to Minikube's kubeconfig file
}

resource "kubernetes_deployment" "sayyamdev/test-project:latest" {
  metadata {
    name = "hello-world-app"
    labels = {
      app = "hello-world"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "hello-world"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello-world"
        }
      }

      spec {
        container {
          name  = "hello-world"
          image = "sayyamdev/test-project:latest"  # Using the locally built Docker image
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hello_world" {
  metadata {
    name = "hello-world-service"
  }

  spec {
    selector = {
      app = "hello-world"
    }

    port {
      port        = 80
      target_port = 5000
    }
    type = "LoadBalancer"
  }
}
