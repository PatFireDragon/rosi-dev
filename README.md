# rosi-dev

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

## Aceleração via gpu NVIDIA

Primeiro instale o nvidia-container-toolkit e os drivers apropriados para a sua placa de vídeo (https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html).

Depois use as seguintes configurações:

```bash
docker run --net="host" -e DISPLAY=${DISPLAY} --gpus 'all,"graphics,display,utility"' -it patfiredragon/rosi:latest
```

Considere também alterar as flags ```--memory``` e ```--cpu``` do docker (https://docs.docker.com/engine/reference/run/).
