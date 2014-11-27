OpenConferenceWare on Docker
==============

Run [OpenConferenceWare](http://openconferenceware.org/) on [Docker](https://www.docker.io/).

This repository triggers the [mpfeil/docker-ocw](https://index.docker.io/u/mpfeil/docker-ocw/) trusted build on the Docker index.
To run:

    docker pull mpfeil/docker-ocw
    docker run -it -p 3000:3000 -t mpfeil/docker-ocw

Then go to [http://localhost:3000](http://localhost:3000)