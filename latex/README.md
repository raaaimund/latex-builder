# Expose

Generate pdf int /out directory 

```
docker build -t expose-builder .
docker run -v $PWD/document/out:/expose/out expose
```