## Overview
Butler is a web-based Know Your Customer (KYC) application meant to assist in slot-filling an entity profile via human-in-the-loop feedback and a simple search query capable of hitting the open and dark web as well as enterprise search repositories.

### Use Cases
The primary use case is to help analysts whose job it is to begin with small piece of information such as a phone number or user handle and understand the complete profile of the entity or persona.  Often times Google search and a speadsheet is used and there exists few tools that aggregate and analyze search results such that the relevant profile information is captured.  Often there is also ambiguity with regards to resolving an entity - Butler is designed to cluster pages in an attempt to group pages and information that is more similar together.

## Installation

### Dependencies
At a high level, Butler depends on four software projects:

1) [CoreNLP Server](https://stanfordnlp.github.io/CoreNLP/corenlp-server.html) (used for entity and information extraction)
2) [Elasticsearch](https://www.elastic.co/products/elasticsearch) (used as the application database)
3) [Butler Server](https://github.com/jgawrilo/butler_server) (scraping, analytic, and data processing component)
4) [Butler UI](https://bitbucket.org/blueridgedynamics/butler) (User interface)

### Full Docker (Recommended Installation for testing)
This installation works with Linux and OS X and requires [Docker](https://docs.docker.com/engine/installation/) and [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) on your machine.  It has been tested with Version 17.09.0.

It is recommended to configure Docker with 2 CPUs and 8 GB of Memory for basic use.

This installation runs each of the four software components listed above in a separate docker container.

1) CoreNLP Server runs on port 9000.
2) Elasticsearch runs on port 9200.
3) Butler Server runs on port 5000.
4) Butler UI runs on port 3000.

#### Quick Docker Install
```
# Go get the project!
git clone https://github.com/jgawrilo/butler_install.git

# Move into the project directory!
cd butler_install

# Install the full app!
./install.sh

# Start the app (all containers) for use/testing!
./start.sh

# Head to http://localhost:3000 in your browser.
# Use the application! 
# See 'Testing' below if you don't know what to do.  Go ahead! Try it out!

# Stop the app (all containers) when you're done!
./stop.sh 
```

## Testing

## Optional Configuration

## User Manual

## License and Acknowledgements
Apache-2.0
Developed under the DARPA Memex program.
