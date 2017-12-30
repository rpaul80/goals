# Goals

This is a web app to create a safe circle of friends to share and complete goals.

## Features

[] Create a Circle
[] Invite a user to a Circle
[] Create a Goal
[] Set updates/timelines for your goals
[] Comment on yours or other goals


## Development

You need docker and docker-compose.

Check this repository out to your $GOPATH.

```docker-compose -f docker/docker-compose.yaml up```

What this does:
1. Spins up an app container with the code mounted as a volume. Revel uses watchers
to reload code in development.
2. Creates a postgres containers
3. Spins up a scratch container which effectively runs a migration on the db and adds some fixture data.


### Go to http://localhost:9000/circles/e46b3c2e-83b5-434b-a37e-152aad47db63

You will see a list of goals for this hard coded circle.

### Go to http://localhost:9000/circles/e46b3c2e-83b5-434b-a37e-152aad47db63/goals/24ab95b5-3f38-42f1-a664-a94439d99ed7#

You will see a specific goal view.

    

## Code Layout

The directory structure of a generated Revel application:

    conf/             Configuration directory
        app.conf      Main app configuration file
        routes        Routes definition file

    app/              App sources
        init.go       Interceptor registration
        controllers/  App controllers go here
        views/        Templates directory

    messages/         Message files

    public/           Public static assets
        css/          CSS files
        js/           Javascript files
        images/       Image files

    tests/            Test suites


## Help

* The [Getting Started with Revel](http://revel.github.io/tutorial/gettingstarted.html).
* The [Revel guides](http://revel.github.io/manual/index.html).
* The [Revel sample apps](http://revel.github.io/examples/index.html).
* The [API documentation](https://godoc.org/github.com/revel/revel).

