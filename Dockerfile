Name: Automate Container Image Build and Push Using GitHub Actions

on: push
  branches:
    - main

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps: 
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Long in to Github Contaigner Registry
        uses: docker/login-action@v2
        with: 
          registry: ghcr.io
          username: ${{yousrakdc}}
          password: ${{ secrets.GITHUB_TOKEN }}
        
        - name: Build and push Docker image
          uses: docker/build-push-action@v4
          with:
            context: .
            push: true
            tags: ghcr.io/${{ github.repository }}:latest
