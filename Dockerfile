ARG BASE_IMAGE
FROM ${BASE_IMAGE}

WORKDIR /app

# Copy poetry metadata first for potential layer caching
COPY pyproject.toml poetry.lock ./

# Install project dependencies using Poetry (assumes Poetry exists in base image).
# Do NOT install Poetry manually.
RUN poetry config virtualenvs.in-project false \
 && poetry install --only main --only test --only build --no-root -v

# Copy the full repository into the image
COPY . .

# Install the local package in editable mode so tests can import it
RUN poetry run pip install -e .

# Do not run tests in the image build; open a shell by default
CMD ["/bin/bash"]
