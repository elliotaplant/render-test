# Use Alpine Linux as the base image
FROM alpine:latest

# Install curl and unzip
RUN apk add --no-cache curl unzip

# Set working directory
WORKDIR /app

# Set the URL as an environment variable
ENV URL http://62.182.86.140/fiction/738000/0ef1933bdc7eac4ed6f1b2aee912b599.epub/Murakami%2C%20Haruki%20-%20Norwegian%20wood.epub

# Set the file name as an environment variable
ENV FILE_NAME book.epub

# Download the file
RUN curl -o ${FILE_NAME} ${URL}

# Unzip the epub file
RUN unzip -o ${FILE_NAME}

# Print the first few lines of the first xhtml file
CMD find . -iname "*.xhtml" -print0 | xargs -0 head
