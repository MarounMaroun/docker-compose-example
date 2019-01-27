### Running

```bash
make run
```

The command above runs `docker-compose up --build`, which builds the containers and runs them.

Let's see the running containers:

```bash
docker-compose ps
```

we'll get something like:

```
           Name                         Command               State           Ports
--------------------------------------------------------------------------------------------
dockercomposeexample_web_1   python src/main.py               Up      0.0.0.0:5000->5000/tcp
elasticsearchdb              /usr/local/bin/docker-entr ...   Up      9200/tcp, 9300/tcp
```

Now we can use `elasticsearchdb` with port 9200 from **inside our service**.

From the host machine, the request

```
curl localhost:5000/hello
```

arrives to the `dockercomposeexample_web_1` container, which performs a simple request to the Elasticsearch DB (they're running on the same network).


You can connect to the *service container* and use `curl` from there:

```
> docker exec -it dockercomposeexample_web_1 bash
$ curl http://elasticsearchdb:9200
```

Note that "elasticsearchdb" is **not known on the host machine**.
