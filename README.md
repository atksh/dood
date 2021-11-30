# dood

```bash
docker build -t dood .
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.ssh:/root/.ssh:ro -v $HOME/.aws:/root/.aws --name dood --privileged dood
```
