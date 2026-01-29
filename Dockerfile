# 1. Base image with Python 3
FROM python:3.9-slim

# 2. Set working directory
WORKDIR /app

# 3. Installing system dependencies (needed for ML libs)
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# 4. Install Python additional packages
RUN pip install --no-cache-dir \
    jupyterlab \
    opencv-python \
    kubernetes \
    swat \
    saspy \
    xgboost \
    scikit-learn \
    matplotlib \
    lightgbm

# 5. Expose Jupyter port
EXPOSE 8888

# 6. Start JupyterLab
#To make Jupyter use a custom token
#--NotebookApp.token=${JUPYTER_TOKEN}
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
