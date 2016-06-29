# rbbt-docker-CImbinator
Analysis of synergies and antagonisms between compounds using Ting-Chao Chou
"median effect theory"

To run this web service you need to setup the port-forwarding and the DISPLAY
variable. To use the docker hub version just run

```bash
docker run -ti -p 127.0.0.1:2887:2887 -e DISPLAY=$DISPLAY mikisvaz/rbbt-ci_mbinator
```

and direct you browser to http://localhost:2887.
