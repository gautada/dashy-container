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

{![Context Diagram](//www.plantuml.com/plantuml/svg/dP51ZzCm48Nl-HKcGYALslJIqmhHXJI2Gu4LrSAXgYet7YKMZctPOzYezBypLhlDajsoqkOIpvlv9Y_Frnwvmz2gv9NKbGe2sDjYDYrckINntL3T5aOZtE5_kbngS1VxhJKQz2L-qMdUokfI5wmoNTlZoHjsyaEdoV6Xqnux2rVhLUSHsZyb3JZhf8VDzl3112suwpAk9FTZflWEr9Zjvn4vZDaSUKtoQoNrpn6jkW7dZTvlopiy39Yv05yvUdjQZl2OFNx_9Ip1voJFVqRFGtsu4Q5gzFEkQCMwcB4RnJNUVbvkiWRH-glfr4Q5Kfru54hkybfY4tQvD9Jyv7vyIjvGeWAMde9d2ybhnrisOGlkcwutc2R9CRqi3PxACKjlutkK78F9KX61g4ToPxWJiH3tHLxpW19SRbpzWEBMAbbnb4R7yVV_bkl6UDmyYSQBo5Aoy4jM46TN_J4uHHb4DXUc9VyvAa5ayWtKsNzl-Bk4tzHzkbaAYQTcBmvSB-asdfjP8SVWMT50zMZs_1lzhcJrwUkFxRByM7vPPAFa6hG8hVeB)

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





