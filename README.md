# review envirionment

python-debian container w/ 
- aws credentials
- ssh private key

```bash
sh install.sh
review {organization or account} {repo} {branch}
```

to delete docker's layer caches
```bash
docker volume rm reviewer_volume
```
