## Overview
Butler is a web-based Know Your Customer (KYC) application meant to assist in slot-filling an entity profile via human-in-the-loop feedback and a simple search query capable of hitting the open and dark web as well as enterprise search repositories.

It's capable of leveraging SRI's Lighthouse Search backend for free text search and information correlation. 

![Butler in Action](https://github.com/jgawrilo/butler_install/raw/master/docs/butler_main.png "Butler - Search in Action")

### Use Cases
The primary use case is to help analysts whose job it is to begin with small piece of information such as a phone number or user handle and understand the complete profile of the entity or persona.  Often times Google search and a speadsheet is used and there exists few tools that aggregate and analyze search results such that the relevant profile information is captured.  Often there is also ambiguity with regards to resolving an entity - Butler is designed to cluster pages in an attempt to group pages and information that is more similar together.

![Butler Profile](https://github.com/jgawrilo/butler_install/raw/master/docs/butler_profile.png "Butler - Profile")

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

```
# Go get the project!
git clone https://github.com/jgawrilo/butler_install.git

# Move into the project directory!
cd butler_install

# Install the full app!
./install.sh

# Start the app (all containers) for use/testing!
./start.sh

# Head to http://localhost:3000 in your browser. Use the application! See 'Testing' below if you don't know what to do.  Go ahead! Try it out!

# Stop the app (all containers) when you're done!
./stop.sh 
```

## Testing
1) Head to http://localhost:300 and ensure you see a screen like below.  When you do, start a project called 'justin'.  ![Butler Start](https://github.com/jgawrilo/butler_install/raw/master/docs/start_project.png "Butler - Start")
2) Type 'justin gawrilow' in the search bar and hit enter.  This starts mining results.  ![Butler Justin Search](https://github.com/jgawrilo/butler_install/raw/master/docs/search_justin.png "Butler - Search for 'justin gawrilow'")
3) The search might take a few minutes to complete.  Please keep in mind the tool goes to the open (and possibly dark) web and pulls results on the fly, taking screenshots, parsing HTML and trying to fill out a profile.  ![Butler Waiting](https://github.com/jgawrilo/butler_install/raw/master/docs/wating.png "Butler - Wating")
4) After some time you should see  a few results come back.  Click on the clusters in the treemap or legend to checkout the pages.  ![Butler Results](https://github.com/jgawrilo/butler_install/raw/master/docs/results.png "Butler - Results come back")
5) You can also check out the profile, by clicking 'Profile' in the upper right corner.  ![Butler Profile](https://github.com/jgawrilo/butler_install/raw/master/docs/butler_profile.png "Butler - Profile")
6) To get more results, click on the 'More' button in the upper left.  Again, after some time you'll see even more pages associated with 'justin gawrilow'  ![Butler More](https://github.com/jgawrilo/butler_install/raw/master/docs/more.png "Butler - More")
7) To start another project, click the button in the upper right and then click 'Close' or just close the browser.  You can always go back to your old project or start a new one.
8) For more information on how to the use more features of the tool, please see the User Manual below.

## Optional Configuration

### Endpoint Configuration

### Dark Web Search or Enterprise Elasticsearch hook up

### Scaling out search infrastructure and page scraping

It's possible to speed up the search and scraping aspect of Butler by installing [gg](https://github.com/jgawrilo/gg/) on separate servers and then adding those endpoints to the [butler_server config.json](https://github.com/jgawrilo/butler_server/blob/master/config.json.template).

Doing this will essentially distribute the search to these servers and will limit the calls any one server will receive.

E.g., 
```
"search_boxes":["http://40.167.321.126:7777/get_urls"]
```

## User Manual
Please download this brief to understand more details about the application: [Butler Cheat Sheet](https://github.com/jgawrilo/butler_install/raw/master/docs/Butler_Cheat_Sheet_Open.pptx)

## License and Acknowledgements
Apache-2.0 and developed under the DARPA Memex program.
