# ISO19157-3 properties uplift example Jupyter notebook

## Running the notebook

### Docker (recommended)

Since the notebook has external dependencies (namely the [ogc-na](https://pypi.org/project/ogc-na/) module),
the easiest way to view the notebook is by using Docker.

After ensuring that you have a working Docker environment, run the following command:

```shell
docker run --rm -p 8888:8888 -v "$(pwd)/work:/notebook/work" dockerogc/jupyter-iso19157-3
```

This will start the Notebook, making it available on port 8888. Check the console output for a link in
the form `http://127.0.0.1:8888/lab?token=abcdef123456`; you will need to use it to access the Notebook.
You can then open the `Uplift pipeline example.ipynb` Notebook file.

Notes: 
* The `--rm` flag above will destroy the Notebook container once you are done with it.
* The `-p 8888:8888` configuration is used to forward port 8888 on your machine to port 8888 in the container.
* `-v "$(pwd)/work:/notebook/work"` mounts a local (in the current directory) `work` subdirectory to the 
`/notebook/work` directory in the container, so that all files created when running the notebook will be available
even after the Notebook is closed. **The syntax maybe different for Windows environments**.

### Locally

To run the Notebook locally, you first need to create a Python virtual environment and install the required packages:

1. Run `python -m venv venv`. This will create a `venv` subdirectory with a virtual environment.
2. Execute `. venv/bin/activate` to activate the virtual environment.
3. Install Jupyter Lab by running `python -m pip install jupyterlab`
4. Install the required dependencies with `python -m pip install -r requirements.txt`.
5. Start the Notebook: `jupyter-lab`

The Notebook will be available on port 8888 (the last command should automatically open
a browser window). You can then open the `Uplift pipeline example.ipynb` Notebook file.
