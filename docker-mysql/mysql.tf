resource "docker_image" "mysql" {
  name = "mysql:8"
}

resource "random_password" "mysql_root_password" {
  length = 16
}

resource "docker_container" "mysql" {
  name = "mysql"
  image = "$docker_image.mysql.latest"
/*  
  env {
    MYSQL_ROOT_PASSWORD = "$random_password.mysql_root_password.result"
  }
*/  
  mounts {
    source = "/some/host/mysql/data/path"
    target = "/var/lib/mysql/data"
    type = "bind"
  }
  ports {
    internal = 33060
    external = 33060
  }
}

