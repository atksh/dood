# dood

```bash
docker build -t dood .
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $SSH_AUTH_SOCK:/tmp/ssh-agent.sock -v $HOME/.aws:/root/.aws --name dood --privileged dood
```
