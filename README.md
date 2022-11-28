# dashy

## Abstract

[Dashy](https://dashy.to) is highly customizable, easy to use, privacy-respecting dashboard app.  It's packed full of useful features, to help you build your perfect dashboard. Including status checks, keyboard shortcuts, dynamic widgets, auto-fetched favicon icons and font-awesome support, built-in authentication, tons of themes, an interactive config editor, many display layouts plus loads more.

The dashboard is used to provide direct access to tools and services generally hosted on a private k8s cluster. This service tracks active tools and services, external vendor services, the status of critical infrastructure, a wish list of future tools and services (since it is easier to create a dashboard item and link to the source than creating the container project)

## Features

- Simple Status Check - ping the internal service to make sure the web service is working.

### Feature Detail

### Simple Status Check

Just a simple ping(http) to the internal service.  To use set *Enable Status Check* equal to `True` and the *Status Check URL* to `http://[service].[namespace].svc.[cluster.local]`

## Exceptions

### Backup

The dashy-container has no state and therefore does not need to be backed up.  No backup script is defined.
 
## Development

## Testing

## Deploy

## Architecture

### Context

{![Context Diagram(Link to image)}

### Container

{![Container Diagram(Link to image)}

### Components

{![Component Diagram(Link to image)}

## Administration

### Checklist

- [x] README conforms to the [gist](https://gist.github.com/gautada/ec549c846e8e50daf355d01b06eb0665)
- [x] .gitignore conforms to the [gist](https://gist.github.com/gautada/3a0a4a76d3c7e4539e71fc02c7f599ad)
- [x] Confirm the drone.yml file
- [x] Volume folders are present (development-volume & backup-volume)
- [x] docker-compose(.yml) works
- [x] Manifst folder present (and origin to private repository is correct
- [x] Issue List is linked to proper URI
- [ ] Signoff ({date and signature of last check})
- [x] Confirm backup (maybe add to testing layer)
- [ ] Confirm healthcheck (maybe add to testing layer)
- [ ] Regenerate all architecture images


### Issues

The official to list is kept in a [GitHub Issue List]{(https://github.com/gautada/dashy-container/issues)}

## Notes





