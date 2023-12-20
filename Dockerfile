# Use Ruby 2.5.0 as the base image with Debian Buster
FROM ruby:2.5-buster

# Set the working directory in the container
WORKDIR /app

# Update the package lists and install required packages
RUN apt-get update && \
    apt-get install -y nodejs build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install required bundler version
RUN gem install bundler -v 1.17.3

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile ./

# Install project dependencies
RUN bundle install

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 for the Rails server
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

