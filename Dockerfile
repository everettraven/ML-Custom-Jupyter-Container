FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

ARG jupyter_token="unsecuretoken"
ARG port="8888"

ENV jupyter_token=${jupyter_token}
ENV port=${port}

CMD jupyter notebook --port=${port} --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token=${jupyter_token}
