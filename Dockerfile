FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

ARG jupyter_token="unsecuretoken"
ARG port="8888"

CMD jupyter notebook --port=${port} --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token=${jupyter_token}
