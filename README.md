# rosi-install

Repositório do Container de desenvolvimento para um projeto educacional utilizando o ROSI.

## Instalação

Primeiro ative o xhost para aceitar conexões locais do docker:

``` 
xhost +local:docker
```

Depois puxe a imagem e rode-a com as configurações abaixo:

```bash
docker pull patfiredragon/rosi:latest
docker run --net="host" -e DISPLAY=${DISPLAY} -it patfiredragon/rosi:latest
```

