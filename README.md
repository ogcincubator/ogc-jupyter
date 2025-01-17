# OGC Examples Jupyter Notebook

## Available notebooks

This repository contains the following notebooks:

* `Update pipeline example.ipynb`: Example of a full data pipeline (from CSV to RDF) for the ISO19157-3 data quality
measure properties.
* `bblocks/`: Notebooks related to the [OGC Building Blocks](https://blocks.ogc.org)
  * `01 Building Blocks basics.ipynb`: Intro to using the Building Blocks.

## Running the notebooks

### Docker (recommended)

Since the notebook has external dependencies (mainly the [ogc-na](https://pypi.org/project/ogc-na/) module),
the easiest way to view the notebook is by using Docker.

After ensuring that you have a working Docker environment, run the following command:

```shell
docker run --rm --pull=always -p 8888:8888 -v "$(pwd)/work:/notebook/work" dockerogc/jupyter-notebooks
```

This will start the Notebook, making it available on port 8888. Check the console output for a link in
the form `http://127.0.0.1:8888/lab?token=abcdef123456`; you will need to use it to access the Notebook.
You can then open the Notebook file you want to use.

Notes: 
* The `--rm` flag above will destroy the Notebook container once you are done with it.
* `--pull=always` guarantees that you are running the latest version of the Docker image.
* The `-p 8888:8888` configuration is used to forward port 8888 on your machine to port 8888 in the container.
* `-v "$(pwd)/work:/notebook/work"` mounts a local (in the current directory) `work` subdirectory to the 
`/notebook/work` directory in the container, so that all files created when running the notebook will be available
even after the Notebook is closed. **The syntax maybe different for Windows environments**.

#### Mounting other directories

Some notebooks may require additional directories to be mounted, such as a local copy of the OGC Building Blocks Register.
You can add as many `-v "/absolute/local/path:/notebook/notebook-path"` parameters to the Docker command before `dockerogc/jupyter-notebooks`,
replacing `/absolute/local/path` with an absolute path on your computer and `notebook-path` with the name that you want to give it inside the
container, for example:

```shell
docker run --rm -p 8888:8888 -v "$(pwd)/work:/notebook/work" -v "/home/user/projects/bblocks:/notebook/bblocks" dockerogc/jupyter-notebooks
```

### Locally

To run the Notebook locally, you first need to create a Python virtual environment and install the required packages:

1. Run `python -m venv venv`. This will create a `venv` subdirectory with a virtual environment.
2. Execute `. venv/bin/activate` to activate the virtual environment.
3. Install Jupyter Lab by running `python -m pip install jupyterlab`
4. Install the required dependencies with `python -m pip install -r requirements.txt`.
5. Start the Notebook: `jupyter-lab`

The Notebook will be available on port 8888 (the last of the commands above should automatically open
a browser window). You can then open the Notebook file you want to use.
