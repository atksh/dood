# dood

```bash
docker build -t dood .
docker run --rm -it -v $SSH_AUTH_SOCK:/tmp/ssh-agent.sock -v $HOME/.aws:/root/.aws:ro --name dood --privileged dood
```
