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

{![Context Diagram](https://plantuml.com/plantuml/svg/dL9DJ-Cm4BtdLvW8QLEfJIyz8RGLcqPmA2mYAdkegigDHuc5OrlsP9UezBypwISK2jBculbwps-USoPrhce1x38Pz9D1REjA_GpEtbVdYT48p_X5bqiDxcI_iaQ3FeKVDPfNCZ_L1QjCKntWmG-srKDHR_DHjCJ6miKqQpn2zPBIWBDEUfZDLxzChGLtJSILvBxB55-0whBbi8Mikco8lA3okPBwgKDKz-2yqSjv-eoh8ynGWCyTdPx84JvYD_V_3tQxrzh9msRhtVRrOqQ4lDJVgoAAQJ9WzufhdDoEPr69QFr5ls_R2hdQyoYKNCI5nB9UnDAGyxtTU9-qeKG5BDmQpqQI5uvNhCSoesgKHeT1iB4j2ciFBkooSDAUdM3ZI1GAxikchOyeM1ZkH9k8NH8Nd8Ze9pAkU8FYrYgPy_KLD7xrFfsMnkFiKsZx0b584lxA7DhPx13MJj7oBJOMfY9dOrI2aC43g8F-lU172V-e-tap5H9tpNtnIFMOdk6xcGmvrfub9UGVPz-iiUKAiflVV-RZz3gz6qMTLm00)

### Container

{![Container Diagram(Link to image)}

### Components

{![Component Diagram(Link to image)}

## Administration

### Checklist

- [2022-11-28](https://github.com/gautada/dashy-container/issues/6)
- [ ] Confirm healthcheck (maybe add to testing layer)
- [ ] Regenerate all architecture images


### Issues

The official to list is kept in a [GitHub Issue List]{(https://github.com/gautada/dashy-container/issues)}

## Notes

- [Error with the dev build](https://github.com/gautada/dashy-container/issues/5) - Was not able to upgrade to 3.17.0.





