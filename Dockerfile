FROM kubor/alpine-rdkit:latest

COPY . /smi2img

WORKDIR /smi2img/java
RUN sh get_opsin.sh

RUN apk update && \
    apk --no-cache add openjdk8

WORKDIR /smi2img
RUN pip install -r requirements.txt

RUN pip install -e .

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
