FROM public.ecr.aws/d3j8x8q7/olympus-base-python:latest

WORKDIR /app

# Copy repository into the image before installing
COPY . .

# Use pip to install in editable mode with test extras to avoid Poetry issues
RUN python -m pip install --upgrade pip
RUN python -m pip install -e ".[test]"

CMD ["/bin/bash"]
