FROM python:3.10-slim

EXPOSE 8888

WORKDIR /notebook
COPY requirements.txt ./

RUN python -m venv /venv && . /venv/bin/activate && \
    python -m pip install -U pip && \
    python -m pip install -r requirements.txt

COPY *.ipynb ./

ENTRYPOINT ["/venv/bin/python", "/venv/bin/jupyter-lab", "--allow-root", "--ip=0.0.0.0"]
